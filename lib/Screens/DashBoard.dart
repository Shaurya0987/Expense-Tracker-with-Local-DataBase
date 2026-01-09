import 'package:expensetracker/Providers/AuthProvider.dart';
import 'package:expensetracker/Providers/CRUDProvider.dart';
import 'package:expensetracker/Screens/AddExpenseScreen.dart';
import 'package:expensetracker/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<StorageProvider>().fetchExpenses();
    });
  }

  String getCurrentPeriod() {
    final now = DateTime.now();
    const months = [
      "January","February","March","April","May","June",
      "July","August","September","October","November","December"
    ];
    return "${months[now.month - 1]} ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    final storageProvider = context.watch<StorageProvider>();

    final totalSpending = storageProvider.expenses.fold<double>(
      0,
      (sum, e) => sum + (e['amount'] as double),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      // ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: const Icon(Icons.calendar_month, color: Colors.blue),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Period",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Text(
              getCurrentPeriod(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              context.read<Authprovider>().logOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const Loginscreen()),
              );
            },
          ),
        ],
      ),

      // ================= BODY =================
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [

              // ================= TOTAL SPENDING CARD =================
              Container(
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Total Spending",
                      style: TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "₹ ${totalSpending.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Progress bar
                    Stack(
                      children: [
                        Container(
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          height: 6,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= ACTION BUTTONS =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ActionBox(
                    title: "Add",
                    icon: Icons.add,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddExpenseScreen(),
                        ),
                      );
                    },
                  ),
                  _ActionBox(
                    title: "Reports",
                    icon: Icons.bar_chart,
                    color: Colors.grey.shade300,
                  ),
                  _ActionBox(
                    title: "Budget",
                    icon: Icons.wallet,
                    color: Colors.teal,
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // ================= RECENT HEADER =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Activity",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ================= EXPENSE LIST =================
              if (storageProvider.expenses.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    "No expenses added yet",
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: storageProvider.expenses.length,
                  itemBuilder: (context, index) {
                    final e = storageProvider.expenses[index];

                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue.shade100,
                        child: const Icon(Icons.receipt_long, color: Colors.blue),
                      ),
                      title: Text(
                        e['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text("${e['date']}  •  ${e['category']}"),
                      trailing: Text(
                        "-₹${e['amount']}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ACTION BOX WIDGET =================
class _ActionBox extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const _ActionBox({
    required this.title,
    required this.icon,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
