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
        title: const Text("Expense Details", style: TextStyle(color: Colors.black)),
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blue.shade100,
                child: Icon(Icons.fastfood_rounded,color: Colors.blue.shade600,size: 40,),
              ),
              SizedBox(height: 15,),
              Text("Burger & Pizza",style: TextStyle(
                letterSpacing: 2,
                fontSize: 21,
                color: Colors.grey.shade700
              ),),
              Text("-\$43.60",style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900
              ),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 3),
                  child: Text("Oct 24, 10.30 AM",style: TextStyle(
                    color: Colors.grey.shade800
                  ),),
                ),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}