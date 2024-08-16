import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/utils/app_keys.dart';
import '../application/provider.dart';

class MenuWidget extends HookConsumerWidget {
  const MenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    final currentMenu = ref.watch(selectedMenuProvider);

    TextStyle style(int i) {
      final selected = currentMenu == i;
      return TextStyle(
        color: selected ? Colors.white : Colors.white.withOpacity(.6),
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
    }

    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      alignment: Alignment.topCenter,
      child: SizedBox(
        // color: Colors.black,
        width: MediaQuery.of(context).size.width,
        // height:
        //     MediaQuery.of(context).size.height / 3, // Adjust height as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 24),
            ListTile(
              title: Text('Focus Areas', style: style(0)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              onTap: () async {
                Navigator.of(context).pop();
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

                ref.read(selectedMenuProvider.notifier).update((state) => 0);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              title: Text('Our Promise', style: style(1)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              onTap: () async {
                Navigator.of(context).pop();
                try {
                  await controller.position.ensureVisible(
                    AppKeys.promiseKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                } on Exception catch (e, st) {
                  log("message", error: e, stackTrace: st);
                }

                ref.read(selectedMenuProvider.notifier).update((state) => 1);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              title: Text('Team', style: style(2)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              onTap: () async {
                Navigator.of(context).pop();
                try {
                  await controller.position.ensureVisible(
                    AppKeys.teamKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                } on Exception catch (e, st) {
                  log("message", error: e, stackTrace: st);
                }

                ref.read(selectedMenuProvider.notifier).update((state) => 2);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              title: Text('Portfolio', style: style(3)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 6),
              onTap: () async {
                Navigator.of(context).pop();
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

                ref.read(selectedMenuProvider.notifier).update((state) => 3);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
