import 'package:expensetracker/Providers/CategoriesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {

  final List<Map<String, dynamic>> categories = [
    {"name": "Food", "icon": Icons.restaurant},
    {"name": "Transport", "icon": Icons.directions_car},
    {"name": "Rent", "icon": Icons.home},
  ];

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = context.watch<Categoriesprovider>();

    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Add Expense",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                "Save",
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [

              const SizedBox(height: 20),

              Text(
                "AMOUNT",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "₹",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: amountController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: const InputDecoration(
                        hintText: "0.00",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(14),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      // DESCRIPTION
      ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.edit, color: Colors.blue),
        title: const Text(
          "Description",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: TextField(
            controller: descriptionController,
            decoration: const InputDecoration(
              hintText: "e.g. Groceries",
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ),

      // const SizedBox(height: 8),
      Divider(color: Colors.grey.shade300),
      // const SizedBox(height: 6),

      // DATE
      ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.date_range, color: Colors.blue),
        title: const Text(
          "Date",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: Colors.grey,
        ),
      ),

      const SizedBox(height: 8),
      Divider(color: Colors.grey.shade300),
      const SizedBox(height: 8),

      // CATEGORY
      Row(
        children: const [
          Icon(Icons.category, color: Colors.blue, size: 22),
          SizedBox(width: 15),
          Text(
            "Category",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),

      const SizedBox(height: 12),

      SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final isSelected =
                categoryProvider.selectedIndex == index;

            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                selected: isSelected,
                onSelected: (_) {
                  context
                      .read<Categoriesprovider>()
                      .selectCategory(index);
                },
                backgroundColor: Colors.grey.shade100,
                selectedColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 8),
                label: Row(
                  children: [
                    Icon(
                      categories[index]["icon"],
                      size: 16,
                      color: isSelected
                          ? Colors.white
                          : Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      categories[index]["name"],
                      style: TextStyle(
                        fontSize: 13,
                        color: isSelected
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

      const SizedBox(height: 8),
      Divider(color: Colors.grey.shade300),
      const SizedBox(height: 6),

      // NOTE
      ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.note, color: Colors.blue),
        title: const Text(
          "Note (optional)",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsets.only(top: 4),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Add details...",
              border: InputBorder.none,
              isDense: true,
            ),
          ),
        ),
      ),
    ],
  ),
),


              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  final selectedCategory =
                      categories[categoryProvider.selectedIndex]["name"];
                  debugPrint("Selected category: $selectedCategory");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Save Expense",
                      style:
                          TextStyle(color: Colors.white, fontSize: 18),
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
