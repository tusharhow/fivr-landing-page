import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension AnimateXX on Widget {
  Animate visibleAnimation(AnimationController animationController) => animate(
        delay: 400.milliseconds,
        // controller: _controller,
        onInit: (controller) => controller = animationController,
        // onComplete: (controller) => controller = _controller,
      ).fadeIn(delay: 300.milliseconds).flipV().scaleY();

  SliverToBoxAdapter toSliverBox() => SliverToBoxAdapter(
        child: this,
      );
}

extension AnimateListXX on List<Widget> {
  AnimateList<Widget> visibleAnimationList(
          AnimationController animationController) =>
      animate(
        delay: 400.milliseconds,
        interval: 200.milliseconds,
        // controller: _controller,
        onInit: (controller) => controller = animationController,
        // onComplete: (controller) => controller = _controller,
      ).fadeIn(delay: 300.milliseconds).flipV().scaleY();
}
