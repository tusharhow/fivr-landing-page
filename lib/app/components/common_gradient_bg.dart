import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonGradientBg extends HookConsumerWidget {
  const CommonGradientBg({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBox(
      detectedKey: "BG_GRADIENT",
      tigerPoint: 0,
      builder: (con, visible) => AnimatedContainer(
        width: double.infinity,
        duration: 800.milliseconds,
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.0),
              Colors.black.withOpacity(.8),
              Colors.black,
              Colors.black,
            ],
            stops: !visible
                ? [0.0, 0.01, 0.15, 0.3, 1.0]
                : const [0.0, 0.14, 0.18, 0.28, 1.0],
          ),
        ),
        child: child,
      ),
    );
  }
}

class CommonGradientBgMobile extends HookConsumerWidget {
  const CommonGradientBgMobile({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      width: double.infinity,
      duration: 800.milliseconds,
      curve: Curves.fastOutSlowIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(.6),
            Colors.black.withOpacity(.85),
            Colors.black.withOpacity(1),
            Colors.black,
          ],
          stops: const [0.0, 0.5, 0.65, 0.8, 0.95, 1.0],
        ),
      ),
      child: child,
    );
  }
}
