import 'package:fivr_landing_page/core/theme/app_colors.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'animated_box.dart';

class MissionVisionWidget extends HookConsumerWidget {
  const MissionVisionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1920 / 800,
      child: AnimatedBox(
        detectedKey: 'Top',
        builder: (con, visible) => Row(
          key: AppKeys.promiseKey,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 2,
              child: !visible
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 90.w,
                        vertical: 56.h,
                      ),
                      alignment: Alignment.bottomCenter,
                      child: SelectableText(
                        "At FIVR, we are driven by the vision to revolutionize the way businesses operate across various sectors. Our mission is to deliver cutting-edge technology solutions that streamline logistics, enhance healthcare services, optimize financial operations, and transform educational experiences.",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 28.sp,
                          height: 1.6,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                      .animate(delay: 100.milliseconds)
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
            10.horizontalSpace,
            Flexible(
              child: Column(
                children: [
                  Flexible(
                    child: !visible
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
                            padding: const EdgeInsets.symmetric(horizontal: 56),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20.w,
                                      width: 20.w,
                                      color: Colors.white,
                                    ),
                                    20.horizontalSpace,
                                    SelectableText(
                                      'Our Mission',
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,
                                        fontSize: 30.sp,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                (16 * 2).verticalSpace,
                                SelectableText(
                                  "At FivR, our mission is to drive innovation and efficiency across key sectors. We harness cutting-edge technology to solve complex challenges in logistics, healthcare, finance, and education. Our dedicated team works tirelessly to deliver scalable solutions that empower businesses and foster sustainable growth.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                            .animate(delay: 100.milliseconds)
                            .fadeIn(delay: 100.milliseconds)
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
                  10.verticalSpace,
                  Flexible(
                    child: !visible
                        ? const SizedBox()
                        : Container(
                            color: AppColors.primroseYellow, // Colors.green,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 56),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 20.w,
                                      width: 20.w,
                                      color: Colors.black,
                                    ),
                                    20.horizontalSpace,
                                    SelectableText(
                                      'Our Vision',
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.black,
                                        fontSize: 30.sp,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                (16 * 2).verticalSpace,
                                SelectableText(
                                  "Our vision is to be the cornerstone of technological advancement, shaping the future of industry and commerce. We aim to create a world where seamless integration of technology solutions makes life easier, healthier, and more prosperous for all. ",
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          )
                            .animate(delay: 100.milliseconds)
                            .fadeIn(delay: 200.milliseconds)
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
