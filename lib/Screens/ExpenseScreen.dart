import 'package:flutter/material.dart';

class Expensescreen extends StatelessWidget {
  const Expensescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Expense Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.fastfood_rounded,
                  color: Colors.blue.shade600,
                  size: 40,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Burger & Pizza",
                style: TextStyle(
                  letterSpacing: 2,
                  fontSize: 21,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 6),
              const Text(
                "-\$43.60",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 3,
                  ),
                  child: Text(
                    "Oct 24, 10.30 AM",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Container(
                  // height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        ListTileWidget(
                          title: 'Category',
                          trailing: 'Food & Drinks',
                          icon: Icons.category,
                          color: Colors.blue,
                        ),
                        Divider(color: Colors.grey.shade200, height: 16),
                        ListTileWidget(
                          title: 'Date',
                          trailing: 'Oct 23,2023',
                          icon: Icons.calendar_month,
                          color: Colors.deepPurple,
                        ),
                        Divider(color: Colors.grey.shade200, height: 16),
                        ListTileWidget(
                          title: 'Account',
                          trailing: 'App Wallet',
                          icon: Icons.wallet,
                          color: Colors.green,
                        ),
                        Divider(color: Colors.grey.shade200, height: 16),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Icon(
                                  Icons.note,
                                  color: Colors.amber.shade600,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Note",
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      "Meeting with client regarding the Q4 marketing strategy proposal",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  backgroundColor: Colors.red.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(5),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete, color: Colors.red.shade600, size: 22),
                    SizedBox(width: 8),
                    Text(
                      "Delete Expense",
                      style: TextStyle(
                        color: Colors.red.shade600,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String trailing;
  final IconData icon;
  final MaterialColor color;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.trailing,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 13),
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.shade100,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, color: color.shade600),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
