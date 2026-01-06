import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text("Add Expense", style: TextStyle(color: Colors.black)),
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

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Text(
                "Amount",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  letterSpacing: 2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 12),

              // ----------- AMOUNT INPUT -----------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "₹",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      width: 160,
                      child: TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: "0.00",
                          hintStyle: TextStyle(
                            fontSize: 45,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        leading: const Icon(
                          Icons.edit_note_sharp,
                          color: Colors.blue,
                          size: 33,
                        ),
                        title: const Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: TextField(
                          controller: descriptionController,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "e.g. Groceries",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Divider(height: 20,color: Colors.grey.shade300,),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        leading: const Icon(
                          Icons.date_range_rounded,
                          color: Colors.blue,
                          size: 30,
                        ),
                        title: const Text(
                          "Date",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text("we"),
                        trailing: Icon(Icons.arrow_forward_ios_outlined,size: 17,color: Colors.grey,),
                        
                      ),

                      Divider(height: 20,color: Colors.grey.shade300,),
                      Row(
                        children: [
                          Icon(Icons.edit)
                        ],
                      ),
                      Divider(height: 20,color: Colors.grey.shade300,),
                      ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        minVerticalPadding: 0,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        leading: const Icon(
                          Icons.edit_note_sharp,
                          color: Colors.blue,
                          size: 33,
                        ),
                        title: const Text(
                          "Note(optional)",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: TextField(
                          controller: descriptionController,
                          style: const TextStyle(fontSize: 15),
                          decoration: const InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "Add details...",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8)
                  ),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                onPressed: (){
                
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check,color: Colors.white,size: 23,fontWeight: FontWeight.w900,),
                  SizedBox(width: 10,),
                  Text("Save Expense",style: TextStyle(
                    color: Colors.white,
                    fontSize: 19
                  ),),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
