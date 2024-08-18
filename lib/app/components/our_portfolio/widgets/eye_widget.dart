import 'package:auto_size_text/auto_size_text.dart';
import 'package:fivr_landing_page/app/components/technology_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';

class EyeWidget extends StatelessWidget {
  const EyeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cattleyaOrchid, // const Color(0xff3B0D3C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AspectRatio(
            aspectRatio: getValueForScreenType(
              context: context,
              mobile: 414 / 262,
              tablet: 833 / 480,
            ),
            child: Image.asset(
              'assets/images/eye.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              scale: 2,
            ),
          ),
          // const SizedBox(height: 28),
          Padding(
            padding: getValueForScreenType(
              context: context,
              mobile:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 28),
              tablet: const EdgeInsets.only(top: 110, left: 46, right: 36),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TechnologyText(
                  textColor: Colors.white,
                  fontSize: 35,
                ),
                Image.asset(
                  'assets/images/segment logo small.png',
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Padding(
            padding: getValueForScreenType(
              context: context,
              mobile: const EdgeInsets.only(
                left: 20,
                bottom: 30,
                right: 12,
                top: 10,
              ),
              tablet: const EdgeInsets.only(
                left: 46,
                bottom: 46,
                right: 72,
                top: 10,
              ),
            ),
            child: AutoSizeText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 18,
                  tablet: 20,
                ),
              ),
              maxFontSize: getValueForScreenType(
                context: context,
                mobile: 18,
                tablet: 20,
              ),
              minFontSize: 6,
            ),
          ),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn(delay: 100.milliseconds)
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: -.05, perspective: .5);
  }
}
