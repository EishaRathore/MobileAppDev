import 'package:flutter_sqlite/Screens/Welcome/welcome_screen.dart';
import '../theme/theme.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/signup.dart';
import '../screens/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
        ),
        dialogBackgroundColor: backgroundColor,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: primaryColor,
          contentTextStyle: TextStyle(color: Colors.white),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: primaryMaterialStateColor,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/home': (context) => Home(),
        '/transaction': (context) => Transaction(),
      },
    );
  }
}
