import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/core.dart';

class NetflixTechWidget extends StatelessWidget {
  const NetflixTechWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primroseYellow, // const Color(0xff288B55),
      padding: const EdgeInsets.only(left: 20, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 56),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 24),
              child: SvgPicture.asset(
                'vectors/netflix.svg',
                height: 48,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcATop,
                ),
              ),
            ),
          ),
          const SizedBox(height: 120),
          Text(
            'Technology',
            style: GoogleFonts.bebasNeue(
              fontSize: 60,
              letterSpacing: .5,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 42),
        ],
      ),
    )
        .animate(delay: 300.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: .05, perspective: .5);
  }
}
