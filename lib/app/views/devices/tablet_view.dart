import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../application/provider.dart';
import '../../components/focus/focus_widget.tablet.dart';
import '../../components/hero/hero_section.tablet.dart';
import '../../components/mission_vision/mission_vision.tablet.dart';

class TabletView extends HookConsumerWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          controller: controller,
          children: [
            const HeroSectionTablet(),
            vGap(context),
            const MissionVisionTabletWidget(),
            vGap(context),
            const FocusTabletWidget(),
            vGap(context),
          ],
        ),
      ),
    );
  }
}
