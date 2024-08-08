import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hover_animation/hover_animation.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';
import '../hero_section.tablet.dart';

class ContactUsBotton extends StatelessWidget {
  const ContactUsBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(left: 20),
        tablet: const EdgeInsets.only(left: 40),
        desktop: EdgeInsets.only(left: 76.w),
      ),
      child: HoverAnimation(
        primaryColor: AppColors.granita, // Colors.black,
        hoverColor: AppColors.purpleCorallites, // const Color(0xff2051FF),
        size: getValueForScreenType(
          context: context,
          mobile: const Size(160, 60),
          tablet: const Size(160, 60),
          desktop: Size(min(236.w, 160), 60),
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        onTap: () {},
        child: Center(
          child: Text(
            'CONTACT US',
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              height: 1.5,
              color: Colors.white,
            ),
          ),
        ),
      )
          .animate(delay: (preTime + 1500).milliseconds)
          .scaleX(alignment: Alignment.centerLeft, duration: 600.milliseconds)
          .slideX(),
    );
  }
}
