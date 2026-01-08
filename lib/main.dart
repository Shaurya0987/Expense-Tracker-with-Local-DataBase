import 'package:expensetracker/Providers/CategoriesProvider.dart';
import 'package:expensetracker/Screens/BottomNavigationBar.dart';
import 'package:expensetracker/Screens/ExpenseScreen.dart';
import 'package:expensetracker/Screens/LoginScreen.dart';
import 'package:expensetracker/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Categoriesprovider()),
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker With Local DataBase',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Loginscreen(),
    );
  }
}

