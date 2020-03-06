import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  Color loweLayerColor, upperLayerColor;
  CurvePainter({@required this.upperLayerColor, this.loweLayerColor});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var paintInner = Paint();
    var path = Path();
    var pathInner = Path();
    paint.color = upperLayerColor;
    paintInner.color = loweLayerColor.withOpacity(0.5);
    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        upperLayerColor.withOpacity(1.0),
        // Colors.green.withOpacity(0.3),
        // Colors.yellow.withOpacity(0.2),
        // Colors.red.withOpacity(0.1),
        loweLayerColor.withOpacity(1.0),
      ],
      stops: [
        0.0,
        // 0.3,
        // 0.5,
        // 0.7,
        1.0,
      ],
    );
    Rect rect = new Rect.fromCircle(
      center: new Offset(165.0, 55.0),
      radius: 180.0,
    );

    // create the Shader from the gradient and the bounding square
    paint.shader = gradient.createShader(rect);

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 3.0;
    path.moveTo(size.width / 4.5, 0);
    path.quadraticBezierTo(
      size.width / 5.8,
      size.height / 13,
      size.width / 3.1,
      size.height / 4.5,
    );
    path.quadraticBezierTo(
      size.width / 2.4,
      size.height / 3,
      size.width / 3,
      size.height / 2.25,
    );
    path.quadraticBezierTo(
      size.width / 3.9,
      size.height / 1.6,
      size.width / 1.8,
      size.height / 1.5,
    );
    path.quadraticBezierTo(
      size.width / 1.4,
      size.height / 1.39,
      size.width / 1.6,
      size.height / 1.2,
    );
    path.quadraticBezierTo(
      size.width / 1.9,
      size.height / 0.95,
      size.width,
      size.height / 1.05,
    );
    path.lineTo(
      size.width,
      0,
    );

    pathInner.moveTo(
      size.width / 4.5,
      0,
    );
    pathInner.quadraticBezierTo(
      size.width / 9,
      size.height / 20,
      size.width / 3.5,
      size.height / 3.8,
    );
    pathInner.quadraticBezierTo(
      size.width / 3,
      size.height / 3,
      size.width / 3.8,
      size.height / 2.25,
    );
    pathInner.quadraticBezierTo(
      size.width / 5,
      size.height / 1.5,
      size.width / 2.5,
      size.height / 1.44,
    );
    pathInner.quadraticBezierTo(
      size.width / 1.55,
      size.height / 1.39,
      size.width / 1.81,
      size.height / 1.15,
    );
    pathInner.quadraticBezierTo(
        size.width / 2.15, size.height / 0.9, size.width, size.height / 1.05);
    pathInner.lineTo(
      size.width,
      0,
    );
    canvas.drawPath(pathInner, paintInner);
    canvas.drawPath(path, paint);
  }

  @override
  shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
