import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';

class FinanceWidget extends StatelessWidget {
  const FinanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: getValueForScreenType(
        context: context,
        mobile: 414 / 545,
        tablet: 833 / 804,
      ),
      child: Container(
        padding: EdgeInsets.all(getValueForScreenType(
          context: context,
          mobile: 20,
          tablet: 40,
        )),
        decoration: const BoxDecoration(
          color: AppColors.primroseYellow, // const Color(0xff288B55),
          image: DecorationImage(
            image: AssetImage('assets/images/finance.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'Finance',
              style: GoogleFonts.bebasNeue(
                color: Colors.white,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 60,
                  tablet: 85,
                ),
                letterSpacing: .5,
                height: 1.6,
              ),
            ),
            SizedBox(
              height: getValueForScreenType(
                context: context,
                mobile: 20,
                tablet: 16,
              ),
            ),
            AutoSizeText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 18,
                  tablet: 28,
                ),
              ),
              maxLines: getValueForScreenType(
                context: context,
                mobile: 4,
                tablet: 3,
              ),
            ),
            const SizedBox(height: 30),
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
          ),
    );
  }
}
