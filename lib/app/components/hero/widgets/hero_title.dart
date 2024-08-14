import 'package:auto_size_text/auto_size_text.dart';
import 'package:fivr_landing_page/core/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroTitle extends StatelessWidget {
  const HeroTitle({
    super.key,
    required this.show,
  });

  static const title1 = 'INNOVATING FOR A SMARTER ';
  static const title2 = 'TOMORROW';
  final bool show;

  @override
  Widget build(BuildContext context) {
    return show
        ? Padding(
            padding: getValueForScreenType(
              context: context,
              desktop: EdgeInsets.only(left: 74.w, right: 500.w),
              tablet: const EdgeInsets.only(left: 40, right: 84),
              mobile: const EdgeInsets.only(left: 32, right: 28),
            ),
            child: AutoSizeText.rich(
              TextSpan(
                text: title1,
                children: [
                  TextSpan(
                    text: title2,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              maxLines: getValueForScreenType(
                context: context,
                mobile: 3,
                tablet: 3,
                desktop: 2,
              ),
              style: GoogleFonts.bebasNeue(
                fontSize: getValueForScreenType(
                  context: context,
                  desktop: 120,
                  tablet: 120,
                  mobile: 65,
                ),
                color: Colors.white,
                height: 1,
              ),
            ),
          ).animate().fadeIn()
        : Container(
            margin: getValueForScreenType(
              context: context,
              desktop: EdgeInsets.only(left: 74.w, right: 500.w),
              tablet: const EdgeInsets.only(left: 40, right: 84),
              mobile: const EdgeInsets.only(left: 32, right: 28),
            ),
            height: (title1 + title2).height(
              style: GoogleFonts.bebasNeue(
                fontSize: getValueForScreenType(
                  context: context,
                  desktop: 120,
                  tablet: 120,
                  mobile: 65,
                ),
                color: Colors.white,
                height: 1,
              ),
              maxLines: getValueForScreenType(
                context: context,
                mobile: 3,
                tablet: 3,
                desktop: 2,
              ),
              maxWidth: getValueForScreenType(
                context: context,
                mobile: 361.w,
                tablet: 608.w,
                desktop: 1076.w,
              ),
            ),
          );
  }
}
