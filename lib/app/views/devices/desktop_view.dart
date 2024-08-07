import 'package:fivr_landing_page/app/components/focus/focus_widget.desktop.dart';
import 'package:fivr_landing_page/app/components/mission_vision/mission_vision.desktop.dart';
import 'package:fivr_landing_page/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../components/common_gradient_bg.dart';
import '../../components/footer_widget.dart';
import '../../components/join_us_widget.dart';
import '../../components/our_portfolio/our_portfolio_widget.desktop.dart';
import '../../components/our_team/our_team_widget.desktop.dart';

final mainScrollerController = Provider.autoDispose<ScrollController>(
  (ref) => ScrollController(),
);

class DesktopView extends StatefulHookConsumerWidget {
  const DesktopView({super.key});

  @override
  createState() => _DesktopViewState();
}

class _DesktopViewState extends ConsumerState<DesktopView>
    with TickerProviderStateMixin {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    // Initialize the list with placeholders
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(mainScrollerController);

    final isTop = useState<bool>(false);
    void listener() {
      isTop.value = scrollController.offset > 00;
    }

    useEffect(() {
      scrollController.addListener(listener);
      return () {
        scrollController.removeListener(listener);
      };
    }, []);
    return Scaffold(
      // backgroundColor: AppColors.vibrantOrange,
      body: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            // shrinkWrap: false,
            children: [
              // const HeroSection(),
              // SizedBox(height: size.height),
              vGap(context),
              const MissionVisionDesktopWidget(),
              vGap(context),
              const FocusDesktopWidget(),
              vGap(context),
              const CommonGradientBg(
                child: Column(
                  children: [
                    OurTeamDesktopWidget(),
                    OurPortfolioDesktopWidget(),
                  ],
                ),
              ),
              const JoinUsWidget(),
              const FooterWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
        child: FloatingActionButton(
          onPressed: () async => await scrollController.animateTo(
            scrollController.position.minScrollExtent,
            duration: 600.milliseconds,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
          child: const Icon(Icons.navigation),
        ).animate(target: isTop.value ? 1 : 0).scaleX().fadeIn(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}

class _FadeInWidget extends StatefulWidget {
  final Widget child;

  const _FadeInWidget({required Key key, required this.child})
      : super(key: key);

  @override
  __FadeInWidgetState createState() => __FadeInWidgetState();
}

class __FadeInWidgetState extends State<_FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key!,
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0 && !_isVisible) {
          _controller.forward();
          setState(() {
            _isVisible = true;
          });
        } else if (visibilityInfo.visibleFraction == 0 && _isVisible) {
          _controller.reset();
          setState(() {
            _isVisible = false;
          });
        }
      },
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
