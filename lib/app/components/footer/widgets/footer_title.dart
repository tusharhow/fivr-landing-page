import 'dart:developer';

import 'package:fivr_landing_page/app/application/provider.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FooterTitles extends HookConsumerWidget {
  const FooterTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    return Wrap(
      spacing: 45,
      runSpacing: 25,
      children: [
        InkWell(
          onTap: () async {
            try {
              await controller.position.ensureVisible(
                AppKeys.focusKey.currentContext
                    ?.findAncestorRenderObjectOfType() as RenderObject,
                duration: 600.milliseconds,
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            } on Exception catch (e, st) {
              log("message", error: e, stackTrace: st);
            }
          },
          child: const Text(
            'Focus Areas',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        InkWell(
          onTap: () async {
            try {
              await controller.position.ensureVisible(
                AppKeys.promiseKey.currentContext?.findRenderObject()
                    as RenderObject,
                duration: 600.milliseconds,
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            } on Exception catch (e, st) {
              log("message", error: e, stackTrace: st);
            }
          },
          child: const Text(
            'Our Promise',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        InkWell(
          onTap: () async {
            try {
              await controller.position.ensureVisible(
                AppKeys.teamKey.currentContext?.findAncestorRenderObjectOfType()
                    as RenderObject,
                duration: 600.milliseconds,
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            } on Exception catch (e, st) {
              log("message", error: e, stackTrace: st);
            }
          },
          child: const Text(
            'Team',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        InkWell(
          onTap: () async {
            try {
              await controller.position.ensureVisible(
                AppKeys.portfolioKey.currentContext
                    ?.findAncestorRenderObjectOfType() as RenderObject,
                duration: 600.milliseconds,
                curve: Curves.fastEaseInToSlowEaseOut,
              );
            } on Exception catch (e, st) {
              log("message", error: e, stackTrace: st);
            }
          },
          child: const Text(
            'Portfolio',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ]
          .animate(delay: 400.milliseconds, interval: 100.milliseconds)
          .fadeIn()
          .slideX(),
    );
  }
}
