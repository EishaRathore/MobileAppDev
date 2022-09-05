import 'package:flutter/material.dart';

const primaryColor = MaterialColor(
  0xFF21A671,
  <int, Color>{
    50: Color(0xFF6F35A5),
    100: Color(0xFF6F35A5),
    200: Color(0xFF6F35A5),
    300: Color(0xFF6F35A5),
    400: Color(0xFF6F35A5),
    500: Color(0xFF6F35A5),
    600: Color(0xFF6F35A5),
    700: Color(0xFF6F35A5),
    800: Color(0xFF6F35A5),
    900: Color(0xFF6F35A5),
  },
);

const backgroundColor = Color(0xFFffffff);
final kErrorStyle = TextStyle(color: Colors.red[300]);
final outlinedButtonTextStyle = TextStyle(color: Colors.white);
final primaryMaterialStateColor = MaterialStateProperty.all(primaryColor);
const kDataColumnTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

final kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 1.0),
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 2.0),
    borderRadius: const BorderRadius.all(
      Radius.circular(32.0),
    ),
  ),
  errorStyle: const TextStyle(fontSize: 15),
);

const kTabViewHeadingStyle = TextStyle(
  fontSize: 25,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);
