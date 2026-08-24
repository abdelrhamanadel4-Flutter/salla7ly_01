import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salla7ly/core/helpers/spacing.dart';
import 'package:salla7ly/core/theming/assets.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key, this.size = 38, this.rating = 0});
  final double size;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var index = 1; index <= 5; index++) ...[
          _Star(filled: rating >= index, size: size),
          if (index < 5) horizontalSpace(6),
        ],
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
