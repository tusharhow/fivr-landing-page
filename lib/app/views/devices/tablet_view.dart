import 'package:fivr_landing_page/app/components/mission_vision/mission_vision.tablet.dart';
import 'package:fivr_landing_page/app/views/devices/desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../components/focus/focus_widget.tablet.dart';

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
            // HeroSection(),
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
