import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/core.dart';

class FinanceWidget extends StatelessWidget {
  const FinanceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
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
          const SizedBox(height: 270),
          Text(
            'Finance',
            style: GoogleFonts.bebasNeue(
              color: Colors.white,
              fontSize: 60,
              letterSpacing: .5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 36),
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
