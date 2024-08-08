import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/core.dart';

class Mosque extends StatelessWidget {
  const Mosque({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.purpleCorallites, // const Color(0xff3B0D3C),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 414 / 264,
            child: Image.asset(
              'assets/images/mosque.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              scale: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectableText(
                  'Technology',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 35,
                    letterSpacing: .5,
                    height: 1.6,
                  ),
                ),
                SvgPicture.asset(
                  'vectors/pixijs.svg',
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SelectableText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: -.05, perspective: .5);
  }
}
