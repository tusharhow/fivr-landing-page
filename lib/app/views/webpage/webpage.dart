import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hover_animation/hover_animation.dart';

class Webpage extends StatefulWidget {
  const Webpage({super.key});

  @override
  State<Webpage> createState() => _WebpageState();
}

class _WebpageState extends State<Webpage> with TickerProviderStateMixin {
  Widget vDivider() => const SizedBox(width: 14);

  Widget hDivider() => const SizedBox(height: 14);

  late final double height;
  late final AnimationController slideAnimationController;
  late final Animation<Offset> slideAnimation;
  late final AnimationController scaleAnimationController;
  late final Animation<double> scaleAnimation;

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
      height = MediaQuery.sizeOf(context).height;
      showOverlay();

      Future.delayed(
        2.seconds,
        () => slideAnimationController.forward()
          ..whenComplete(
            () => Future.delayed(
              1.2.seconds,
              () => scaleAnimationController.forward(),
            ),
          ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    slideAnimationController.dispose();
    scaleAnimationController.dispose();
  }

  showOverlay() async {
    final state = Overlay.of(context);

    final whiteBg = OverlayEntry(
      builder: (context) => Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
      ).animate(delay: 4.5.seconds).fadeOut(),
    );
    final slider = OverlayEntry(
      builder: (context) => AnimatedBuilder(
        animation: scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            alignment: Alignment.topLeft,
            scale: scaleAnimation.value,
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
            color: Colors.green,
          ),
        ),
      ),
    );

    state.insert(whiteBg);
    state.insert(slider);

    await Future.delayed(5.seconds, () {
      whiteBg.remove();
      slider.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return LayoutBuilder(builder: (context, constrain) {
      final height = constrain.maxHeight;
      final width = constrain.maxWidth;

      log('$height : $width');

      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * .9,
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      color: Colors.blue,
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
                                  style: TextStyle(
                                      fontSize: size.width * 0.04,
                                      color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: 'SMARTER ',
                                      style: TextStyle(
                                          fontSize: size.width * 0.04,
                                          color: Colors.white),
                                    ),
                                    TextSpan(
                                      text: 'TOMORROW',
                                      style: TextStyle(
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
                                  style: TextStyle(
                                      fontSize: size.width * 0.01,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text:
                                          ' to transform lives and industries.  ',
                                      style: TextStyle(
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
                                padding:
                                    EdgeInsets.only(left: size.width * 0.04),
                                child: HoverAnimation(
                                  primaryColor: Colors.black,
                                  hoverColor: const Color(0xff2051FF),
                                  size: const Size(180, 60),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  onTap: () {},
                                  child: const Center(
                                    child: Text(
                                      'CONTACT US',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 14,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Container(
                      width: width / 10,
                      color: Colors.black,
                    )
                        .animate(delay: 5.seconds)
                        .fadeIn()
                        .then(delay: 100.milliseconds)
                        .slideX(begin: 1, end: 0),
                  ),
                ],
              ),
            ),
            hDivider(),
            Container(
              height: height * .9,
              color: Colors.amber,
            ),
            hDivider(),
            Container(
              height: height * .9,
              color: Colors.purpleAccent,
            ),
            hDivider(),
          ],
        ),
      );
    });
  }
}
