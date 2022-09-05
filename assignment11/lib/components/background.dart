import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color(0xFF21A671)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width * 0.9166667, 0);
    path_0.lineTo(
      size.width * 0.9166667,
      size.height * 0.7473842,
    );
    path_0.quadraticBezierTo(
      size.width * 0.8847222,
      size.height * 0.8015695,
      size.width * 0.7944444,
      size.height * 0.8056801,
    );
    path_0.cubicTo(
      size.width * 0.7590278,
      size.height * 0.8056801,
      size.width * 0.6944444,
      size.height * 0.8112855,
      size.width * 0.6388889,
      size.height * 0.8056801,
    );
    path_0.cubicTo(
      size.width * 0.6017361,
      size.height * 0.8034380,
      size.width * 0.5274306,
      size.height * 0.7959641,
      size.width * 0.4902778,
      size.height * 0.7922272,
    );
    path_0.cubicTo(
      size.width * 0.4414444,
      size.height * 0.7882063,
      size.width * 0.3359028,
      size.height * 0.7887145,
      size.width * 0.2430556,
      size.height * 0.8131540,
    );
    path_0.cubicTo(
      size.width * 0.1566944,
      size.height * 0.8333034,
      size.width * 0.1182917,
      size.height * 0.8704484,
      size.width * 0.0736111,
      size.height * 0.9028401,
    );
    path_0.quadraticBezierTo(
      size.width * 0.0528889,
      size.height * 0.9256353,
      0,
      size.height * 0.9940209,
    );
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
