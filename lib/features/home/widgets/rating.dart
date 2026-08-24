import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/assets.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({this.size = 38});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Star(filled: false, size: size),
        horizontalSpace(6),
        _Star(filled: false, size: size),
        horizontalSpace(6),
        _Star(filled: true, size: size),
        horizontalSpace(6),
        _Star(filled: true, size: size),
        horizontalSpace(6),
        _Star(filled: true, size: size),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  final bool filled;
  final double size;

  const _Star({required this.filled, this.size = 38});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      width: size.w,
      filled ? Assets.svgsStar : Assets.svgsStarNptFill,
    );
  }
}
