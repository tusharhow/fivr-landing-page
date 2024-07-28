import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef AnimatedBoxBuilder = Widget Function(AnimationController, bool);

class AnimatedBox extends HookConsumerWidget {
  const AnimatedBox({
    super.key,
    required this.detectedKey,
    required this.builder,
  });

  final String detectedKey;
  final AnimatedBoxBuilder builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: 300.milliseconds,
    );

    final isVisible = useState<bool>(false);
    return VisibilityDetector(
      key: ValueKey(detectedKey),
      onVisibilityChanged: (visibilityInfo) {
        log("${visibilityInfo.key} ${visibilityInfo.visibleFraction} $isVisible");
        if (visibilityInfo.visibleFraction > 0) {
          controller.forward();

          isVisible.value = true;
        } else {
          controller.reset();

          isVisible.value = false;
        }
      },
      child: builder(controller, isVisible.value),
    );
  }
}
