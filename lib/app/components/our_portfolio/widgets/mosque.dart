import 'package:fivr_landing_page/app/components/technology_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
            aspectRatio: getValueForScreenType(
              context: context,
              mobile: 414 / 264,
              tablet: 833 / 480,
            ),
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
            padding: getValueForScreenType(
              context: context,
              mobile: const EdgeInsets.only(left: 22, right: 22, top: 30),
              tablet: const EdgeInsets.only(left: 40, right: 40, top: 100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TechnologyText(fontSize: 35, textColor: Colors.white),
                SvgPicture.asset(
                  'vectors/pixijs.svg',
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getValueForScreenType(
                context: context,
                mobile: 22,
                tablet: 40,
              ),
            ),
            child: SelectableText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 18,
                  tablet: 20,
                ),
                height: 1.5,
              ),
            ),
          ),
          SizedBox(
              height: getValueForScreenType(
            context: context,
            mobile: 30,
            tablet: 40,
          )),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: -.05, perspective: .5);
  }
}
