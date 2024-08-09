import 'package:fivr_landing_page/app/components/common_gradient_bg.dart';
import 'package:fivr_landing_page/app/components/footer/footer_widget.mobile.dart';
import 'package:fivr_landing_page/app/components/hero/hero_section.mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../application/provider.dart';
import '../../components/focus/focus_widget.mobile.dart';
import '../../components/hero/vertical_menu.mobile.dart';
import '../../components/join_us/join_us_widget.mobile.dart';
import '../../components/logo_widget.dart';
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
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            floating: false,
            // snap: true,
            pinned: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            // toolbarHeight: 0,
            leadingWidth: 108,
            leading: const LogoWidget(),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 20),
                child: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  icon: Image.asset(
                    'assets/images/ham burger.png',
                    width: 45,
                    height: 24,
                  ),
                ),
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.purpleCorallites, //  Color(0xff2051FF),
                    AppColors.purpleHeather, // Color(0xffCDD4F0),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              // child: AppBar(
              //   backgroundColor: Colors.transparent,
              //   elevation: 0,
              //   shadowColor: Colors.transparent,
              //   surfaceTintColor: Colors.transparent,
              //   leadingWidth: 108,
              //   leading: Padding(
              //     padding: const EdgeInsets.only(left: 34, top: 20, bottom: 12),
              //     child: Image.asset(
              //       'assets/images/FivR.png',
              //       width: 108,
              //     ),
              //   ),
              // ),
            )
                .animate(delay: 700.milliseconds)
                .show()
                .then(delay: 100.milliseconds)
                .fadeIn(duration: 600.milliseconds)
                .scaleX(
                  begin: 1.2,
                  end: 1,
                  alignment: Alignment.centerLeft,
                ),
          ),
          const SliverToBoxAdapter(child: HeroSectionMobile()),
          vGap(context).toBoxSliver(),
          const MissionVisionMobileWidget().toBoxSliver(),
          vGap(context).toBoxSliver(),
          const FocusMobileWidget().toBoxSliver(),
          vGap(context).toBoxSliver(),
          CommonGradientBgMobile(
            child: Column(
              children: [
                const OurTeamMobileTabletWidget(),
                const OurPortfolioMobileTabletWidget(),
                vGap(context),
              ],
            ),
          ).toBoxSliver(),
          const EyeWidget().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const NetflixTechWidget().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const FinanceWidget().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const PixiJS1().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const PixiJS2().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const Mosque().toBoxSliver(),
          vGapBlack(context).toBoxSliver(),
          const Road().toBoxSliver(),
          vGap(context).toBoxSliver(),
          const JoinUsWidgetMobile().toBoxSliver(),
          const FooterWidgetMobile().toBoxSliver(),
        ],
      ),
      endDrawer: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 10, color: Colors.white),
          VerticalTextMenuMobile(
            scaffoldKey: scaffoldKey,
          ),
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
