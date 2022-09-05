import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerWidgetScreen extends StatefulWidget {
  @override
  _AnimatedContainerWidgetScreenState createState() =>
      _AnimatedContainerWidgetScreenState();
}

class _AnimatedContainerWidgetScreenState
    extends State<AnimatedContainerWidgetScreen> {
  int duration = 300;
  double width = 150;
  double height = 150;
  Color color = Colors.blue;
 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:Text('Animated Container'),
         leading: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Icon(
                    Icons.arrow_back, // add custom icons also
                  ),
                ),
      ),
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: duration),
         curve: Curves.fastOutSlowIn,
        color: color,
        width: width,
       height: height,
        
          
          ),
         
          SizedBox(height: 10,),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              RaisedButton(
                child: Text('Animate Size'),
                onPressed: _animateContainerSize,
              ),
              RaisedButton(
                child: Text('Animate Color'),
                onPressed: _animateContainerColor,
              ),
              RaisedButton(
                child: Text('Animate Size & Color'),
                onPressed: () {
                  _animateContainerColor();
                  _animateContainerSize();
                },
              ),
             
             
            ],
          )
        ],

        
      ),
    ),
    );
  }
  void _animateContainerSize() {
    Random random = Random();
    setState(() {
      width = (random.nextInt(150) + 50).toDouble();
      height = (random.nextInt(150) + 50).toDouble();
      duration = 300;
    });
  }

  void _animateContainerColor() {
    setState(() {
      // Generate random color
      color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      duration = 500;
    });
  }


}