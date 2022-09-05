import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'assignment1.dart';
import 'assignment2.dart';
import 'assignment3.dart';
import 'assignment4.dart';
import 'assignment5.dart';
import 'assignment6.dart';
import 'assignment7.dart';
import 'assignment8.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 9',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/assignment1': (context) => Assignment1(),
        '/assignment2': (context) => Assignment2(),
        '/assignment3': (context) => Assignment3(),
        '/assignment4': (context) => Assignment4(),
        '/assignment5': (context) => Assignment5(),
        '/assignment6': (context) => Assignment6(),
        '/assignment7': (context) => Assignment7(),
        '/assignment8': (context) => Assignment8(),
      },
    );
  }
}
