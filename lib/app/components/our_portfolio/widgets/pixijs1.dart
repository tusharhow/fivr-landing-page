import 'package:fivr_landing_page/app/components/technology_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';

class PixiJS1 extends StatelessWidget {
  const PixiJS1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cattleyaOrchid, // const Color(0xff3B0D3C),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/pixiJS-BG.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.all(
        getValueForScreenType(
          context: context,
          mobile: 20,
          tablet: 40,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'vectors/pixijs.svg',
                height: 42.h,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TechnologyText(
                fontSize: 35,
                textColor: Colors.white,
              ),
              const SizedBox(height: 18),
              SelectableText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
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
