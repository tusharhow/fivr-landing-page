import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/core.dart';

class PixiJS2 extends StatelessWidget {
  const PixiJS2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.purpleHeather, // const Color(0xff3B0D3C),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              'vectors/pixijs.svg',
              height: 42.h,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 44),
          SelectableText(
            'Technology',
            style: GoogleFonts.bebasNeue(
              fontSize: 35,
              letterSpacing: .5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 10),
          SelectableText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn()
        .flipH(
          begin: -0.1,
          end: 0,
          alignment: Alignment.center,
          duration: 100.milliseconds,
        )
        .scaleY(
          begin: .9,
          alignment: Alignment.center,
        );
  }
}
