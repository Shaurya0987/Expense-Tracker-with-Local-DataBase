// ignore_for_file: deprecated_member_use

import 'package:expensetracker/utils/Colors.dart';
import 'package:expensetracker/utils/Texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            borderRadius: BorderRadius.circular(12),
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
    return Container(
      child: Stack(
        children: [
          Positioned(
            right: -150,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -200,
            bottom: -470,
            child: Container(
              height: 600,
              width: 700,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 15,
            child: Container(height: 30, child: Image.asset("assets/logo.png")),
          ),
          Positioned(
            top: 62,
            left: 25,
            child: ModifiedText(
              text: "it's where you want to be",
              color: Colors.grey.shade900,
              size: 15,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("6532 4567 3414 7683",style: GoogleFonts.sourceCodePro(fontSize: 24,color: Colors.grey.shade700,fontWeight: FontWeight.bold),),
                Text("SHAURYA THAKUR",style: GoogleFonts.sourceCodePro(fontSize: 20,color: Colors.grey.shade600,fontWeight: FontWeight.bold),),
              ],
            )
          ),
          Positioned(
            right: 10,
            child: Container( 
            height: 80,
            child: Image.asset("assets/chip.png")))
        ],
      ),
    );
  }
}
