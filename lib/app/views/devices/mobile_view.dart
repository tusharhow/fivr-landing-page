import 'package:fivr_landing_page/app/components/footer/footer_widget.mobile.tablet.dart';
import 'package:fivr_landing_page/app/components/hero/hero_section.mobile.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../application/provider.dart';
import '../../components/common_gradient_bg.dart';
import '../../components/focus/focus_widget.mobile.dart';
import '../../components/join_us/join_us_widget.mobile.tablet.dart';
import '../../components/mission_vision/mission_vision.mobile.dart';
import '../../components/our_portfolio/our_portfolio_widget.mobile.tablet.dart';
import '../../components/our_portfolio/widgets/widgets.dart';
import '../../components/our_team/our_team_widget.mobile.tablet.dart';

class MobileView extends HookConsumerWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    final scaffoldKey = useMemoized<GlobalKey<ScaffoldState>>(GlobalKey.new);

    final isTop = useState<bool>(false);
    void listener() {
      isTop.value = controller.offset > 00;
    }

    useEffect(() {
      controller.addListener(listener);

      return () {
        controller.removeListener(listener);
      };
    }, []);

    return Scaffold(
      key: scaffoldKey,
      body: ListView(
        key: AppKeys.listViewKey,
        controller: mobileScrollCOntroller,
        children: [
          const HeroSectionMobile(),
          vGap(context),
          const MissionVisionMobileWidget(),
          vGap(context),
          const FocusMobileWidget(),
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
          const JoinUsWidgetMobileTablet(),
          const FooterWidgetMobileTablet(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: FloatingActionButton(
          onPressed: () async => await controller.animateTo(
            controller.position.minScrollExtent,
            duration: 600.milliseconds,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
          child: const Icon(Icons.navigation),
        ).animate(target: isTop.value ? 1 : 0).scaleX().fadeIn(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}

extension SliverX on Widget {
  SliverToBoxAdapter toBoxSliver() => SliverToBoxAdapter(child: this);
}
