import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hover_animation/hover_animation.dart';

import 'vertical_menu.dart';

const slideTime = 1000;
const scaleTime = 300;

/// 1000 + 300 = 1300 milliseconds
const preTime = 1000;

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController slideAnimationController;
  late final Animation<Offset> slideAnimation;
  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;

  final GlobalKey globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    slideAnimationController =
        AnimationController(vsync: this, duration: 750.milliseconds);
    scaleAnimationController =
        AnimationController(vsync: this, duration: 300.milliseconds);

    slideAnimation = Tween<Offset>(
            begin: const Offset(0.0, 730), end: const Offset(0.0, 0.0))
        .animate(slideAnimationController);
    scaleAnimation =
        Tween<double>(begin: 1, end: .9).animate(scaleAnimationController);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // showOverlay();

      // Future.delayed(
      //   slideTime.milliseconds,
      //   () => slideAnimationController.forward()
      //     ..whenComplete(
      //       () => Future.delayed(
      //         scaleTime.milliseconds,
      //         () => scaleAnimationController.forward(),
      //       ),
      //     ),
      // );
    });
  }

  showOverlay() async {
    final state = Overlay.of(context);

    final whiteBg = OverlayEntry(
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
      ).animate(delay: 3.2.seconds).fadeOut(duration: 300.milliseconds),
    );

    final slider = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            alignment: Alignment.topLeft,
            // scale: scaleAnimation.value,
            scaleY: scaleAnimation.value * 1.05,
            scaleX: scaleAnimation.value,
            child: Opacity(
              opacity: scaleAnimation.value,
              child: child,
            ),
          );
        },
        child: AnimatedBuilder(
          animation: slideAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: slideAnimation.value,
              child: child,
            );
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff2051FF),
                  Color(0xffCDD4F0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
        ),
      ),
    );

    state.insert(whiteBg);
    state.insert(slider);

    // await Future.delayed(5.seconds, () {
    //   whiteBg.remove();
    //   slider.remove();
    // });

    scaleAnimationController.addListener(() {
      if (scaleAnimationController.isCompleted) {
        whiteBg.remove();
        slider.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AspectRatio(
      aspectRatio: 1920 / 961,
      child: Row(
        key: globalKey,
        children: [
          Expanded(
            flex: 10,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff2051FF),
                    Color(0xffCDD4F0),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.045,
                      ),
                      child: const Text(
                        'FivR',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.height * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: Text.rich(
                        strutStyle: StrutStyle(
                            fontSize: size.width * 0.05, height: 0.5),
                        TextSpan(
                          text: 'INNOVATING FOR A\n',
                          style: GoogleFonts.bebasNeue(
                              fontSize: size.width * 0.04, color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'SMARTER ',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: size.width * 0.04,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: 'TOMORROW',
                              style: GoogleFonts.bebasNeue(
                                  fontSize: size.width * 0.04,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.height * 0.03),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: Text.rich(
                        strutStyle: StrutStyle(
                            fontSize: size.width * 0.05, height: 0.01),
                        TextSpan(
                          text:
                              'At FivR, we believe in the power of technology\n',
                          style: GoogleFonts.roboto(
                              fontSize: size.width * 0.01, color: Colors.black),
                          children: [
                            TextSpan(
                              text: ' to transform lives and industries.  ',
                              style: GoogleFonts.roboto(
                                  fontSize: size.width * 0.01,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: size.height * 0.07),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: HoverAnimation(
                        primaryColor: Colors.black,
                        hoverColor: const Color(0xff2051FF),
                        size: const Size(180, 60),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'CONTACT US',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 18, color: Colors.white),
                          ),
                        ),
                      )
                          .animate(delay: (preTime + 3200).milliseconds)
                          .scaleX(
                              alignment: Alignment.centerLeft,
                              duration: 600.milliseconds)
                          .slideX(),
                    ),
                  ),
                ],
              ),
            )
                .animate(delay: 700.milliseconds)
                .show()
                .then(delay: 100.milliseconds)
                .fadeIn(duration: 600.milliseconds)
                .scaleX(
                  begin: 1.2,
                  end: 1,
                  alignment: Alignment.centerLeft,
                ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: VerticalTextMenu(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }
}
