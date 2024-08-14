import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../logo_widget.dart';
import 'vertical_menu.desktop.tablet.dart';
import 'widgets/widgets.dart';

const slideTime = 1000;
const scaleTime = 300;

/// 1000 + 300 = 1300 milliseconds
const preTime = 1000;

class HeroSectionTablet extends StatefulHookConsumerWidget {
  const HeroSectionTablet({super.key});

  @override
  ConsumerState<HeroSectionTablet> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<HeroSectionTablet> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isComplete = useState<bool>(false);
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: BoxConstraints(
          maxHeight:
              constraints.maxWidth <= 1536 ? size.height : size.height * .9,
          minHeight: size.height * .9,
        ),
        child: AspectRatio(
          aspectRatio: 834.w / 909.h,
          child: Row(
            key: globalKey,
            children: [
              Expanded(
                child: Container(
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
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoWidget(),
                      const SizedBox(height: 70),
                      HeroTitle(show: isComplete.value),
                      const SizedBox(height: 42),
                      HeroSubtitle(isComplete: isComplete.value),
                      const SizedBox(height: 38),
                      const ContactUsBotton(),
                      const SizedBox(height: 18),
                    ],
                  ),
                )
                    .animate(delay: 700.milliseconds)
                    .show()
                    .then(delay: 100.milliseconds)
                    .fadeIn(duration: 600.milliseconds)
                    .scaleX(
                      begin: 1.2,
                      end: 1,
                      alignment: Alignment.centerLeft,
                    )
                    .callback(
                      callback: (value) => isComplete.value = true,
                    ),
              ),
              hGap(context),
              VerticalTextMenuDesktopTablet(rowKey: globalKey),
            ],
          ),
        ),
      );
    });
  }
}
