import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hover_animation/hover_animation.dart';

import '../../../core/core.dart';
import 'vertical_menu.desktop.dart';

const slideTime = 1000;
const scaleTime = 300;

/// 1000 + 300 = 1300 milliseconds
const preTime = 1000;

class HeroSectionDesktop extends StatefulHookConsumerWidget {
  const HeroSectionDesktop({super.key});

  @override
  ConsumerState<HeroSectionDesktop> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<HeroSectionDesktop>
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
    final isComplete = useState<bool>(false);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: BoxConstraints(
          maxHeight:
              constraints.maxWidth <= 1536 ? size.height : size.height * .9,
          minHeight: size.height * .9,
        ),
        child: Row(
          key: globalKey,
          children: [
            Expanded(
              flex: 10,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.purpleCorallites, //  Color(0xff2051FF),
                      AppColors.purpleHeather, // Color(0xffCDD4F0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 92.w)
                          .copyWith(top: 28.h),
                      child: Image.asset(
                        'assets/images/FivR.png',
                        width: 100.h,
                        height: 36.h,
                      ),
                    ),
                    // SizedBox(height: size.height * 0.03),
                    !isComplete.value
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(left: 74.w),
                            child: SizedBox(
                              width: 1000.w,
                              child: SelectableText.rich(
                                TextSpan(
                                  text: 'INNOVATING FOR A SMARTER',
                                  children: [
                                    TextSpan(
                                      text: 'TOMORROW',
                                      style: GoogleFonts.bebasNeue(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                style: GoogleFonts.bebasNeue(
                                  fontSize: 120.sp,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                          ).animate().fadeIn(),
                    // SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: EdgeInsets.only(left: 72.w),
                      child: SizedBox(
                        width: 720.w,
                        child: SelectableText.rich(
                          TextSpan(
                            text: '                ',
                            children: [
                              const TextSpan(
                                text:
                                    'At FivR, we believe in the power of technology',
                              ),
                              TextSpan(
                                text: ' to transform lives and industries.  ',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: GoogleFonts.roboto(
                            fontSize: 35.sp,
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: size.height * 0.07),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 0.04),
                      child: HoverAnimation(
                        primaryColor: AppColors.granita, // Colors.black,
                        hoverColor: AppColors
                            .purpleCorallites, // const Color(0xff2051FF),
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
                              fontSize: 20.sp,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                          .animate(delay: (preTime + 1500).milliseconds)
                          .scaleX(
                              alignment: Alignment.centerLeft,
                              duration: 600.milliseconds)
                          .slideX(),
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
                  )
                  .callback(
                    callback: (value) => isComplete.value = true,
                  ),
            ),
            10.horizontalSpace,
            const Expanded(
              child: VerticalTextMenuDesktop(),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }
}
