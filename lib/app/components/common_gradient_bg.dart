import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonGradientBg extends HookConsumerWidget {
  const CommonGradientBg({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
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
          stops: const [0.0, 0.14, 0.18, 0.28, 1.0],
        ),
      ),
      child: child,
    );
  }
}
