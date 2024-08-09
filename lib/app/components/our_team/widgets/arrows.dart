import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Arrows extends StatelessWidget {
  const Arrows({
    super.key,
    required this.visible,
    required this.scrollLeft,
    required this.scrollRight,
  });

  final bool visible;
  final VoidCallback scrollLeft;
  final VoidCallback scrollRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(right: 22, bottom: 25),
        tablet: const EdgeInsets.only(right: 40, bottom: 30),
      ),
      child: !visible
          ? const SizedBox(height: 36)
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: scrollLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: SvgPicture.asset(
                      'assets/icons/left_arrow.svg',
                      height: 20,
                      width: 68,
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                InkWell(
                  onTap: scrollRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.w),
                    child: SvgPicture.asset(
                      'assets/icons/right_arrow.svg',
                      height: 20,
                      width: 68,
                    ),
                  ),
                ),
              ],
            )
              .animate()
              .fadeIn()
              .scaleX(
                  alignment: Alignment.centerRight, duration: 600.milliseconds)
              .slideX(begin: 1, end: 0),
    );
  }
}
