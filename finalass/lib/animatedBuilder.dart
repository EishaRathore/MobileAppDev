import 'package:flutter/material.dart';


 class AnimatedBuilderWidget  extends StatefulWidget {
  @override
  _AnimatedBuilderWidgetState createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget >
    with SingleTickerProviderStateMixin {
  final Image ufo = Image.asset('assets/ufo.png', width:5300 ,);
  late AnimationController _animation;

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
        title:Text('Animated Builder'),
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
       // color: const Color(0xff7c94b6),
        image: DecorationImage(
          image: AssetImage('assets/milky-way.jpg',),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.overlay),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
         child: Stack(
             alignment: AlignmentDirectional.center,
      children: <Widget>[
       
        AnimatedBuilder(
          animation: _animation,
          builder: (_, __) {
            return ClipPath(
              clipper: const BeamClipper(),
              child: Container(
                height: 1000,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.7,
                    colors: [
                      Colors.white,
                      Colors.orange.shade400,
                      
                      Colors.transparent,
                      
                    ],
                    stops: [0,0, _animation.value,],
                  ),
                ),
              ),
            );
          },
        ),
        ufo,
      ],
         )
         ),
     ),
    );
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}