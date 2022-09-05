import 'package:flutter/material.dart';

class CrossFadeAnimation extends StatefulWidget {
  @override
  _CrossFadeAnimationState createState() => _CrossFadeAnimationState();
}

class _CrossFadeAnimationState extends State<CrossFadeAnimation> {
  bool _firstChild = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Animated Cross Fade'),
         leading: GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Icon(
                    Icons.arrow_back, // add custom icons also
                  ),
                ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              height: 60,
              color: Colors.orange.shade200,
            ),
            AnimatedCrossFade(
              firstCurve: Curves.easeInCubic,
              secondCurve: Curves.easeInCirc,
              firstChild: InkWell(
                onTap: () {
                  setState(() {
                    _firstChild = !_firstChild;
                  });
                },
                child: Container(
                  child: ClipOval(
                    
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      maxRadius:120,
                      child: Image.asset(
                        'logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              ),
              secondChild: InkWell(
                onTap: () {
                  setState(() {
                    _firstChild = !_firstChild;
                  });
                },
                child: Container(
                  height: 350,
                  width: 350,
                  child: Image.asset(
                    'back.jpeg',
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amberAccent.shade700,
                ),
              ),
              crossFadeState:
                  _firstChild ? CrossFadeState.showFirst :    CrossFadeState.showSecond,
              duration: Duration(seconds: 2),
              layoutBuilder: (
                Widget topChild,
                Key topChildKey,
                Widget bottomChild,
                Key bottomChildKey,
              ) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    PositionedDirectional(
                      child: bottomChild,
                      key: bottomChildKey,
                      top: 0,
                    ),
                    PositionedDirectional(
                      child: topChild,
                      key: topChildKey,
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              width: double.infinity,
              height: 60,
              color: Colors.red.shade200,
            ),
          ],
        ),
      ),
    );
  }
}