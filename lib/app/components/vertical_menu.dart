import 'package:fivr_landing_page/app/components/hero_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalTextMenu extends StatelessWidget {
  const VerticalTextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final sideMenuTextStyle = GoogleFonts.montserrat(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      height: 1.11,
      letterSpacing: .9,
      color: Colors.white60,
    );
    return Container(
      color: Colors.black,
      width: 212,
      height: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 116),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'PORTFOLIO',
                style: sideMenuTextStyle,
              ),
            ),
            // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'TEAM',
                style: sideMenuTextStyle,
              ),
            ),
            // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'OUR PROMISE',
                style: sideMenuTextStyle,
              ),
            ),
            // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                'FOCUS AREAS',
                style: sideMenuTextStyle.copyWith(color: Colors.white),
              ),
            ),
          ]
              .animate(
                  delay: (preTime + 2200).milliseconds,
                  interval: 200.milliseconds)
              .fadeIn()
              .scaleY(alignment: Alignment.topCenter),
        ),
      ),
    ).animate(delay: (preTime + 1800).milliseconds).slideX(begin: 1, end: 0);
  }
}
