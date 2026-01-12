// ignore_for_file: deprecated_member_use

import 'package:expensetracker/utils/Colors.dart';
import 'package:flutter/material.dart';

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.green,
            boxShadow: AppColors.shadows,
            borderRadius: BorderRadius.circular(12)
          ),
          margin: EdgeInsets.all(15),
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: content(),
        ),
      ),
    );
  }
}

class content extends StatelessWidget {
  const content({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Stack(
        children: [
          Positioned(
            right: -150,
            child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle
            ),
          )),
          Positioned(
            left: -200,
            bottom: -470,
            child: Container(
            height: 600,
            width: 700,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle
            ),
          )),
          Positioned(
            top: 20,
            left: 15 ,
            child: Container(
              height: 30,
              child: Image.asset("assets/logo.png"),
            )
            ),
          Positioned(
            child: )
        ],
      ),
    );
  }
}