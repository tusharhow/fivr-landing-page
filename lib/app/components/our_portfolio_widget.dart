import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurPortfolioWidget extends HookConsumerWidget {
  const OurPortfolioWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 130,
            top: size.width * 0.05,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SelectableText(
              'Our portfolio',
              style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.075,
        ),
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
        AspectRatio(
          // height: MediaQuery.of(context).size.height * 0.6,
          aspectRatio: 1920 / 700,
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 60, 0),
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/segment logo small.png',
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 16 * 2),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 36),
                                  child: SelectableText(
                                    'Technology',
                                    style: GoogleFonts.bebasNeue(
                                      color: Colors.white,
                                      fontSize: 30,
                                      height: 1.4,
                                      letterSpacing: .5,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 36,
                                  bottom: 16 * 2,
                                  right: 26,
                                  top: 10,
                                ),
                                child: SelectableText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
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
                const SizedBox(width: 10),
                Expanded(
                  flex: 59,
                  child: !visible
                      ? const SizedBox()
                      : Container(
                          color: AppColors
                              .primroseYellow, // const Color(0xff288B55),

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 56,
                                  top: 16 * 3,
                                  right: 16,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: SelectableText(
                                        'Technology',
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 48,
                                          letterSpacing: .5,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 36),
                                      child: SvgPicture.asset(
                                        'vectors/netflix.svg',
                                        height: 62,
                                        colorFilter: const ColorFilter.mode(
                                          Colors.black,
                                          BlendMode.srcATop,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 48, bottom: 16 * 2, right: 16 * 3),
                                child: SelectableText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: TextStyle(
                                    fontSize: 18,
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
        const SizedBox(height: 10),
        AspectRatio(
          // height: MediaQuery.of(context).size.height * 0.7,
          aspectRatio: 1920 / 700,
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
                                  fontSize: 48,
                                  letterSpacing: .5,
                                  height: 1.6,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SelectableText(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 50)
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
                const SizedBox(width: 10),
                Expanded(
                  flex: 39,
                  child: Column(
                    children: [
                      !visible
                          ? const SizedBox()
                          : Expanded(
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
                                padding: const EdgeInsets.all(38)
                                    .copyWith(bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                        'vectors/pixijs.svg',
                                        height: 32,
                                      ),
                                    ),
                                    const SizedBox(height: 16 * 2),
                                    Text(
                                      'Technology',
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.white,
                                        fontSize: 30,
                                        letterSpacing: .5,
                                        height: 1.6,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
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
                      const SizedBox(height: 10),
                      !visible
                          ? const SizedBox()
                          : Expanded(
                              child: Container(
                                color: AppColors
                                    .purpleHeather, // const Color(0xff3B0D3C),

                                padding: const EdgeInsets.all(38)
                                    .copyWith(bottom: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                        'vectors/pixijs.svg',
                                        height: 32,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 16 * 2),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: SelectableText(
                                        'Technology',
                                        style: GoogleFonts.bebasNeue(
                                          fontSize: 30,
                                          letterSpacing: .5,
                                          height: 1.6,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    SelectableText(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        height: 1.5,
                                      ),
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
        const SizedBox(height: 10),
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
                                      const EdgeInsets.fromLTRB(36, 36, 36, 12),
                                  child: SvgPicture.asset(
                                    'vectors/pixijs.svg',
                                    height: 32,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(36, 0, 0, 8),
                                child: SelectableText(
                                  'Technology',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: 30,
                                    letterSpacing: .5,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(36, 0, 36, 36),
                                child: SelectableText(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 14,
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
                const SizedBox(width: 10),
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
                          padding: const EdgeInsets.all(36),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  'assets/images/segment logo small.png',
                                  height: 48,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Spacer(),
                              SelectableText(
                                'Technology',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: 48,
                                  letterSpacing: .5,
                                  height: 1.6,
                                ),
                              ),
                              const SelectableText(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
        const SizedBox(height: 10),
      ],
    );
  }
}
