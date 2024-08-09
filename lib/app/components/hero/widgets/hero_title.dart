import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroTitle extends StatelessWidget {
  const HeroTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        desktop: EdgeInsets.only(left: 74.w),
        tablet: const EdgeInsets.only(left: 40, right: 84),
        mobile: const EdgeInsets.only(left: 32, right: 28),
      ),
      child: SelectableText.rich(
        TextSpan(
          text: 'INNOVATING FOR \nA SMARTER',
          children: [
            TextSpan(
              text: '\nTOMORROW',
              style: GoogleFonts.bebasNeue(
                color: Colors.black,
              ),
            ),
          ],
        ),
        style: GoogleFonts.bebasNeue(
          fontSize: getValueForScreenType(
            context: context,
            desktop: 120.sp,
            tablet: 80,
            mobile: 65,
          ),
          color: Colors.white,
          height: 1,
        ),
      ),
    ).animate().fadeIn();
  }
}
