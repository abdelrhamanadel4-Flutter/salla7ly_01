import 'package:flutter/material.dart';
import 'package:salla7ly/core/theming/app_color.dart';

class ProblemContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radius = 10.0;
    const arrowWidth = 40.0;

    final path = Path();

    // بداية الشكل
    path.moveTo(radius, 0);

    // الخط العلوي
    path.lineTo(size.width - arrowWidth, 0);

    // رأس السهم
    path.lineTo(size.width, size.height / 2);

    // نهاية السهم
    path.lineTo(size.width - arrowWidth, size.height);

    // الخط السفلي
    path.lineTo(radius, size.height);

    // الركن السفلي الشمال
    path.quadraticBezierTo(
      0,
      size.height,
      0,
      size.height - radius,
    );

    // الخط الشمال
    path.lineTo(0, radius);

    // الركن العلوي الشمال
    path.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    path.close();

    // الخلفية
    final fillPaint = Paint()
      ..color = AppColors.whiteColor
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, fillPaint);

    // الـ Border
    final borderPaint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}