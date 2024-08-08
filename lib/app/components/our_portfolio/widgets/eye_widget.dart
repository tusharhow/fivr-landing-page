import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
            aspectRatio: 414 / 262,
            child: Image.asset(
              'assets/images/eye.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              scale: 2,
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Technology',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 35,
                    height: 1.4,
                    letterSpacing: .5,
                  ),
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
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
              right: 12,
              top: 10,
            ),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18,
              ),
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
