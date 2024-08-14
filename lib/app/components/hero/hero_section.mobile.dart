import 'dart:developer';

import 'package:fivr_landing_page/app/components/hero/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/core.dart';
import '../../../core/utils/app_keys.dart';
import '../../application/provider.dart';
import '../logo_widget.dart';

const slideTime = 1000;
const scaleTime = 300;

/// 1000 + 300 = 1300 milliseconds
const preTime = 1000;
final mobileScrollCOntroller = ScrollController();

class HeroSectionMobile extends StatefulHookConsumerWidget {
  const HeroSectionMobile({super.key});

  @override
  ConsumerState<HeroSectionMobile> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<HeroSectionMobile>
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

    return Container(
      width: 1.sw,
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
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LogoWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 20),
                child: IconButton(
                  onPressed: () {
                    showFullWidthMenu(
                      context,
                      ref.watch(mainScrollerController),
                      ref,
                    );
                  },
                  icon: Image.asset(
                    'assets/images/ham burger.png',
                    width: 45,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: size.height * 0.03),
          const SizedBox(height: 100),
          HeroTitle(show: isComplete.value),
          const SizedBox(height: 54),
          HeroSubtitle(isComplete: isComplete.value),
          const SizedBox(height: 42),
          const ContactUsBotton(),
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
        );
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }
}

void showFullWidthMenu(
  BuildContext context,
  ScrollController controller,
  WidgetRef ref,
) {
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return const MenuWidget();
  //   },
  // );

  showMenu(
    context: context,
    position: const RelativeRect.fromLTRB(0, 0, 0, 00),
    constraints: BoxConstraints(minWidth: 1.sw),
    color: Colors.black,
    items: [
      PopupMenuItem(
        child: const ListTile(
          title: Text(
            "Focus Areas",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () async {
          try {
            await mobileScrollCOntroller.position.ensureVisible(
              AppKeys.focusKey.currentContext?.findAncestorRenderObjectOfType()
                  as RenderObject,
              duration: 600.milliseconds,
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } on Exception catch (e, st) {
            log("message", error: e, stackTrace: st);
          }

          ref.read(selectedMenuProvider.notifier).update((state) => 0);
        },
      ),
      PopupMenuItem(
        child: const ListTile(
          title: Text(
            "Our Promise",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () async {
          try {
            await mobileScrollCOntroller.position.ensureVisible(
              AppKeys.promiseKey.currentContext
                  ?.findAncestorRenderObjectOfType() as RenderObject,
              duration: 600.milliseconds,
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } on Exception catch (e, st) {
            log("message", error: e, stackTrace: st);
          }

          ref.read(selectedMenuProvider.notifier).update((state) => 0);
        },
      ),
      PopupMenuItem(
        child: const ListTile(
          title: Text(
            "Team",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () async {
          try {
            await mobileScrollCOntroller.position.ensureVisible(
              AppKeys.teamKey.currentContext?.findAncestorRenderObjectOfType()
                  as RenderObject,
              duration: 600.milliseconds,
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } on Exception catch (e, st) {
            log("message", error: e, stackTrace: st);
          }

          ref.read(selectedMenuProvider.notifier).update((state) => 0);
        },
      ),
      PopupMenuItem(
        child: const ListTile(
          title: Text(
            "Portfolio",
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () async {
          try {
            await mobileScrollCOntroller.position.ensureVisible(
              AppKeys.portfolioKey.currentContext
                  ?.findAncestorRenderObjectOfType() as RenderObject,
              duration: 600.milliseconds,
              curve: Curves.fastEaseInToSlowEaseOut,
            );
          } on Exception catch (e, st) {
            log("message", error: e, stackTrace: st);
          }

          ref.read(selectedMenuProvider.notifier).update((state) => 0);
        },
      ),
    ],
  );
}
