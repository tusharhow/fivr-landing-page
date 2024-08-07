import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/theme/app_colors.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:fivr_landing_page/core/utils/internal_gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'square_box.dart';

class MissionVisionMobileWidget extends HookConsumerWidget {
  const MissionVisionMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: AppKeys.promiseKey,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 580,
          child: AnimatedBox(
            detectedKey: 'TOP-1',
            builder: (con, visible) => !visible
                ? const SizedBox()
                : Container(
                    decoration: BoxDecoration(
                      color: AppColors.vibrantOrange,
                      image: DecorationImage(
                        image: const AssetImage('assets/images/img1.png'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          AppColors.vibrantOrange.withOpacity(.8),
                          BlendMode.multiply,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    alignment: Alignment.bottomCenter,
                    child: Text.rich(
                      const TextSpan(
                        text: '                     ',
                        children: [
                          TextSpan(
                            text:
                                '"At FIVR, we are driven by the vision to revolutionize the way businesses operate across various sectors. Our mission is to deliver cutting-edge technology solutions that streamline logistics, enhance healthcare services, optimize financial operations, and transform educational experiences."',
                          ),
                        ],
                      ),
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        height: 1.4,
                        fontWeight: FontWeight.w400,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  )
                    .animate()
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
          ),
        ),
        vGap(context),
        SizedBox(
          height: 392,
          child: AnimatedBox(
            detectedKey: 'TOP-2',
            builder: (con, visible) => !visible
                ? const SizedBox()
                : Container(
                    decoration: const BoxDecoration(
                      color: AppColors.cattleyaOrchid,
                      // image: DecorationImage(
                      //   image: AssetImage('assets/images/img2.png'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SquareBox(color: Colors.white),
                            const SizedBox(width: 22),
                            Text(
                              'Our Mission',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 30,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        (16 * 2).verticalSpace,
                        Text(
                          "At FivR, our mission is to drive innovation and efficiency across key sectors. We harness cutting-edge technology to solve complex challenges in logistics, healthcare, finance, and education. Our dedicated team works tirelessly to deliver scalable solutions that empower businesses and foster sustainable growth.",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                    .animate()
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
          ),
        ),
        vGap(context),
        SizedBox(
          height: 392,
          child: AnimatedBox(
            detectedKey: 'TOP-3',
            builder: (con, visible) => !visible
                ? const SizedBox()
                : Container(
                    color: AppColors.primroseYellow, // Colors.green,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SquareBox(color: Colors.black),
                            const SizedBox(width: 22),
                            Text(
                              'Our Vision',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.black,
                                fontSize: 30,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        (16 * 2).verticalSpace,
                        Text(
                          "Our vision is to be the cornerstone of technological advancement, shaping the future of industry and commerce. We aim to create a world where seamless integration of technology solutions makes life easier, healthier, and more prosperous for all. ",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                    .animate()
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
          ),
        ),
      ],
    );
  }
}
