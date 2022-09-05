import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  @override
  _AnimatedAlignWidgetState createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  AlignmentGeometry _alignment = Alignment.topRight;
  AlignmentGeometry _geometry = Alignment.bottomLeft;

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
      _geometry = _alignment == Alignment.topRight
          ? Alignment.bottomLeft
          : Alignment.topRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Align'),
           leading: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Icon(
                    Icons.arrow_back, // add custom icons also
                  ),
                ),
        ),
    body:DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/angryback.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Stack(
            children: [
              AnimatedAlign(
                alignment: _alignment,
                curve: Curves.easeInOutBack,
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/redbird.png',
                  height: 115,
                  width: 115,
                ),
              ),
              AnimatedAlign(
                alignment: _geometry,
                curve: Curves.easeInCirc,
                duration: Duration(seconds: 3),
                child: Image.asset(
                  'assets/blackbird.png',
                  height: 125,
                  width: 125,
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => _changeAlignment(),
                  child: Text('START'),
                ),
              )
            ],
          ),
        ),
        ),
    );
  }
}