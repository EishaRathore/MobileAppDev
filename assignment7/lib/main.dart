import 'package:flutter/material.dart';
import 'MessageList.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.red,
      ),
     home: MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}
