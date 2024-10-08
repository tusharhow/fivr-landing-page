import 'package:auto_size_text/auto_size_text.dart';
import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/core.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurPortfolioDesktopWidget extends HookConsumerWidget {
  const OurPortfolioDesktopWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      key: AppKeys.portfolioKey,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 130.w,
            top: 140.h,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: AutoSizeText(
              'Our portfolio',
              style: GoogleFonts.bebasNeue(fontSize: 80, color: Colors.white),
              maxLines: 1,
            ),
          ),
        ),
        78.verticalSpace,
        // SizedBox(
        //   height: 2450,
        //   child: Center(
        //     child: SelectableText(
        //       "Portfolio Block",
        //       style: Theme.of(context)
        //           .textTheme
        //           .headlineLarge!
        //           .copyWith(color: AppColors.vibrantOrange),
        //     ),
        //   ),
        // ),

        const _PortfolioWidget(),
      ],
    );
  }
}

class _PortfolioWidget extends HookConsumerWidget {
  const _PortfolioWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        //. 1st row
        AspectRatio(
          // height: MediaQuery.of(context).size.height * 0.6,
          aspectRatio: 1920.w / 810.w,
          child: AnimatedBox(
            detectedKey: 'PORTFOLIO TOP',
            builder: (con, visible) => Row(
              children: [
                Expanded(
                  flex: 40,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          color: AppColors
                              .cattleyaOrchid, // const Color(0xff3B0D3C),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Image.asset(
                                  'assets/images/eye.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  scale: 2,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 30.h, 65.w, 0),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/segment logo small.png',
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              42.verticalSpace,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 48.w),
                                  child: AutoSizeText(
                                    'Technology',
                                    style: GoogleFonts.bebasNeue(
                                      color: Colors.white,
                                      fontSize: 35,
                                      height: 1.4,
                                      letterSpacing: .5,
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 48.w,
                                  bottom: 36.w,
                                  right: 56.w,
                                  top: 10.w,
                                ),
                                child: AutoSizeText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  maxLines: 4,
                                ),
                              ),
                            ],
                          ),
                        )
                          .animate()
                          .fadeIn()
                          .flipV(begin: -.05, perspective: .5)
                          .flipH(begin: -.05, perspective: .5),
                ),
                20.horizontalSpace,
                Expanded(
                  flex: 59,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          color: AppColors
                              .primroseYellow, // const Color(0xff288B55),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 72.w,
                                  top: 78.h,
                                  right: 64.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Technology',
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 80.sp,
                                        letterSpacing: .5,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'vectors/netflix.svg',
                                      height: 72.h,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.black,
                                        BlendMode.srcATop,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 58.w,
                                  bottom: 28.h,
                                  right: 58.w,
                                ),
                                child: AutoSizeText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                          .animate()
                          .fadeIn()
                          .flipV(begin: -.05, perspective: .5)
                          .flipH(begin: .05, perspective: .5),
                ),
              ],
            ),
          ),
        ),
        20.verticalSpace,

        //. 2nd row
        AspectRatio(
          // height: MediaQuery.of(context).size.height * 0.7,
          aspectRatio: 1920.w / 810.w,
          child: AnimatedBox(
            detectedKey: "Portfolio mid",
            builder: (con, visible) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 59,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.only(
                            left: 36,
                            right: 36,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors
                                .primroseYellow, // const Color(0xff288B55),

                            image: DecorationImage(
                              image: AssetImage('assets/images/finance.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SelectableText(
                                'Finance',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 85.sp,
                                  letterSpacing: .5,
                                  height: 1.6,
                                ),
                              ),
                              16.verticalSpace,
                              AutoSizeText(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the ",
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                maxLines: 2,
                              ),
                              82.verticalSpace,
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
                20.horizontalSpace,
                Expanded(
                  flex: 39,
                  child: Column(
                    children: [
                      !visible
                          ? const SizedBox()
                          : Flexible(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColors
                                      .cattleyaOrchid, // const Color(0xff3B0D3C),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/pixiJS-BG.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: 48.w,
                                  left: 48.w,
                                  right: 48.w,
                                  bottom: 22.w,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                        'vectors/pixijs.svg',
                                        height: 42.w,
                                      ),
                                    ),
                                    // SizedBox(height: 32.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          'Technology',
                                          style: GoogleFonts.bebasNeue(
                                            color: Colors.white,
                                            fontSize: 35,
                                            letterSpacing: .5,
                                            height: 1.6,
                                          ),
                                          maxLines: 1,
                                        ),
                                        SizedBox(height: 14.w),
                                        SizedBox(
                                          width: double.maxFinite,
                                          child: AutoSizeText(
                                            "Our dedicated team works tirelessly to deliver scalable solutions that empower businesses and foster sustainable growth.",
                                            style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20,
                                              height: 1.5,
                                            ),
                                            maxLines: 2,
                                            maxFontSize: 20,
                                            minFontSize: 8,
                                            // softWrap: true,
                                            overflow: TextOverflow.visible,
                                            wrapWords: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                      vGap(context),
                      !visible
                          ? const SizedBox()
                          : Flexible(
                              child: Container(
                                color: AppColors.purpleHeather,
                                padding: EdgeInsets.all(48.w),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                        'vectors/pixijs.svg',
                                        height: 42.w,
                                        color: Colors.black,
                                      ),
                                    ),
                                    AutoSizeText(
                                      'Technology',
                                      style: GoogleFonts.bebasNeue(
                                        fontSize: 35,
                                        letterSpacing: .5,
                                        height: 1.2,
                                      ),
                                      maxLines: 1,
                                    ),
                                    // SizedBox(height: 10.w),
                                    AutoSizeText(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                        height: 1.5,
                                      ),
                                      maxLines: 4,
                                      maxFontSize: 20,
                                      minFontSize: 0,
                                      wrapWords: true,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
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
                                  ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        vGap(context),

        //. 3rd row
        AspectRatio(
          // height: MediaQuery.of(context).size.height * 0.6,
          aspectRatio: 1920 / 700,
          child: AnimatedBox(
            detectedKey: 'PORTFOLIO BOTTOM',
            builder: (con, visible) => Row(
              children: [
                Expanded(
                  flex: 40,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          decoration: const BoxDecoration(
                            color: AppColors
                                .purpleCorallites, // const Color(0xff3B0D3C),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                  'assets/images/mosque.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                  scale: 2,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, 64.h, 64.w, 0),
                                  child: SvgPicture.asset(
                                    'vectors/pixijs.svg',
                                    height: 42.h,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(48.w, 0, 48.w, 8),
                                child: SelectableText(
                                  'Technology',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: 35.sp,
                                    letterSpacing: .5,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(48.w, 0, 48.w, 40.h),
                                child: SelectableText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                          .animate()
                          .fadeIn()
                          .flipV(begin: -.05, perspective: .5)
                          .flipH(begin: -.05, perspective: .5),
                ),
                20.horizontalSpace,
                Expanded(
                  flex: 60,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          decoration: const BoxDecoration(
                            color: AppColors
                                .primroseYellow, // const Color(0xff288B55),
                            image: DecorationImage(
                              image: AssetImage('assets/images/road.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: EdgeInsets.all(72.w).copyWith(bottom: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/segment logo small.png',
                                  height: 68.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText(
                                    'Technology',
                                    style: GoogleFonts.bebasNeue(
                                      color: Colors.white,
                                      fontSize: 85.sp,
                                      letterSpacing: .5,
                                      height: 1.6,
                                    ),
                                  ),
                                  9.verticalSpace,
                                  SelectableText(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.sp,
                                    ),
                                  ),
                                  64.verticalSpace,
                                ],
                              ),
                            ],
                          ),
                        )
                          .animate()
                          .fadeIn()
                          .flipV(begin: -.05, perspective: .5)
                          .flipH(begin: .05, perspective: .5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
