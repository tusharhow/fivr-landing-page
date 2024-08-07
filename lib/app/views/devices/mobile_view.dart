import 'package:fivr_landing_page/app/components/focus/focus_widget.mobile.dart';
import 'package:fivr_landing_page/app/components/our_portfolio/our_portfolio_widget.mobile.dart';
import 'package:fivr_landing_page/app/components/our_team/our_team_widget.mobile.dart';
import 'package:fivr_landing_page/app/views/devices/desktop_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../components/common_gradient_bg.dart';
import '../../components/mission_vision/mission_vision.mobile.dart';

class MobileView extends HookConsumerWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // HeroSection(),
              vGap(context),
              const MissionVisionMobileWidget(),
              vGap(context),
              const FocusMobileWidget(),
              vGap(context),
              const CommonGradientBg(
                child: Column(
                  children: [
                    OurTeamMobileWidget(),
                    OurPortfolioMobileWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
