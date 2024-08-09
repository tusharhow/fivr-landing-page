import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/core.dart';

class Road extends HookConsumerWidget {
  const Road({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primroseYellow, // const Color(0xff288B55),
        image: DecorationImage(
          image: AssetImage('assets/images/road.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 36),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/segment logo small.png',
              height: 68.h,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 150),
          SelectableText(
            'Technology',
            style: GoogleFonts.bebasNeue(
              color: Colors.white,
              fontSize: 60,
              letterSpacing: .5,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),
          const SelectableText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: .05, perspective: .5);
  }
}
