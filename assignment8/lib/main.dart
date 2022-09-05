import 'package:assignment8/HomePagedrawer.dart';
import 'package:assignment8/part_1.dart';
import 'package:assignment8/part_2.dart';
import 'package:flutter/material.dart';

// import 'MainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabs App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/part_1': (context) => Part_1(),
        '/part_2': (context) => Part_2(),
      },
    );
  }
}
