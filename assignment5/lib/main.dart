import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'AddRecords.dart';
import 'ViewRecords.dart';
// import 'MainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Records',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/addrecords': (context) => AddRecords(),
        '/viewrecords': (context) => ViewRecords(),
      },
    );
  }
}
