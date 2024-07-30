import 'package:fivr_landing_page/app/application/general_provider.dart';
import 'package:fivr_landing_page/app/components/our_team_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../components/common_gradient_bg.dart';
import '../../components/focus_widget.dart';
import '../../components/hero_section.dart';
import '../../components/mission_vision.dart';
import '../../components/our_portfolio_widget.dart';

final mainScrollerController = Provider<ScrollController>(
  (ref) => throw UnimplementedError(),
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
    Future.microtask(
        () => ref.read(generalProvider.notifier).update((state) => false));

    // Initialize the list with placeholders
  }

  bool _isWidgetInView(int index) {
    final double itemPosition =
        index * 100.0; // Assuming each widget has a fixed height of 100
    final double viewportHeight = _scrollController.position.viewportDimension;
    final double offset = _scrollController.offset;

    return itemPosition >= offset - viewportHeight &&
        itemPosition <= offset + viewportHeight;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final scrollController = useScrollController();
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
              const HeroSection(),
              // SizedBox(height: size.height),
              const SizedBox(height: 10),
              const MissionVisionWidget(),
              const SizedBox(height: 10),
              const FocusWidget(),
              const SizedBox(height: 10),
              const CommonGradientBg(
                child: Column(
                  children: [
                    OurTeamWidget(),
                    OurPortfolioWidget(),
                  ],
                ),
              ),
              Container(
                color: Colors.orange,
                height: size.height * 0.1,
                width: size.width * 0.8,
                child: const Center(child: Text('Orange Container')),
              ),
              Container(
                color: Colors.teal,
                height: size.height * 0.1,
                width: size.width * 0.8,
                child: const Center(child: Text('Teal Container')),
              ),
              Container(
                color: Colors.pink,
                height: size.height * 0.1,
                width: size.width * 0.8,
                child: const Center(child: Text('Pink Container')),
              ),
              Container(
                color: Colors.brown,
                height: size.height * 0.1,
                width: size.width * 0.8,
                child: const Center(child: Text('Brown Container')),
              ),
              Container(
                color: Colors.grey,
                height: size.height * 0.1,
                width: size.width * 0.8,
                child: const Center(child: Text('Grey Container')),
              )
            ],
          ),
        ),
      ),
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
