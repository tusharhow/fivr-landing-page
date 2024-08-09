import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../application/provider.dart';
import '../../components/common_gradient_bg.dart';
import '../../components/footer/footer_widget.mobile.dart';
import '../../components/join_us/join_us_widget.mobile.dart';
import '../../components/our_portfolio/our_portfolio_widget.mobile.tablet.dart';
import '../../components/our_portfolio/widgets/widgets.dart';
import '../../components/our_team/our_team_widget.mobile.tablet.dart';

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
            //   const HeroSectionTablet(),
            //   vGap(context),
            //   const MissionVisionTabletWidget(),
            //   vGap(context),
            //   const FocusTabletWidget(),
            vGap(context),
            CommonGradientBgMobile(
              child: Column(
                children: [
                  const OurTeamMobileTabletWidget(),
                  const OurPortfolioMobileTabletWidget(),
                  vGap(context),
                ],
              ),
            ),
            const EyeWidget(),
            vGapBlack(context),
            const NetflixTechWidget(),
            vGapBlack(context),
            const FinanceWidget(),
            vGapBlack(context),
            const PixiJS1(),
            vGapBlack(context),
            const PixiJS2(),
            vGapBlack(context),
            const Mosque(),
            vGapBlack(context),
            const Road(),
            vGap(context),
            const JoinUsWidgetMobile(),
            const FooterWidgetMobile(),
          ],
        ),
      ),
    );
  }
}
