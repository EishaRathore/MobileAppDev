import 'package:flutter/material.dart';

import 'animatedBuilder.dart';
import 'animatedContainer.dart';
import 'animatedCrossfade.dart';
import 'animationAlign.dart';
import 'home.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomeScreen()
      ),
        routes: {
        '/home': (context) => HomeScreen(),
        '/animatedAlign': (context) => AnimatedAlignWidget(),
        '/animatedBuilder': (context) => AnimatedBuilderWidget(),
        '/animatedContainer': (context) => AnimatedContainerWidgetScreen (),
        '/animatedCrossFade': (context) => CrossFadeAnimation(),
      },
    );
  }
}