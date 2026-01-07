import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Icon(Icons.calendar_month_sharp,color: Colors.blue,size: 30,),
        ),
      ),
      body: Column(),
    );
  }
}