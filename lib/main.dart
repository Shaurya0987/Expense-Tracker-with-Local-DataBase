import 'package:expensetracker/Providers/AuthProvider.dart';
import 'package:expensetracker/Providers/CRUDProvider.dart';
import 'package:expensetracker/Providers/CategoriesProvider.dart';
import 'package:expensetracker/Screens/SplashScreen.dart';
import 'package:expensetracker/Screens/VisaCardScreen.dart';
import 'package:expensetracker/firebase_options.dart';
import 'package:expensetracker/utils/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>Categoriesprovider()),
    ChangeNotifierProvider(create: (_)=>Authprovider()),
    ChangeNotifierProvider(create: (_)=>StorageProvider()),
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
        brightness: Brightness.light,
        primaryColor: AppColors.bgColor
      ),
      home:Splashscreen(),
    );
  }
}

