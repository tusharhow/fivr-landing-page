import 'package:fivr_landing_page/app/components/hero/hero_section.desktop.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/core.dart';
import '../../application/provider.dart';

final selectedMenuProvider = StateProvider<int?>((ref) {
  return null;
});

class VerticalTextMenuDesktop extends HookConsumerWidget {
  const VerticalTextMenuDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(mainScrollerController);
    final menuIndex = ref.watch(selectedMenuProvider);
    final sideMenuTextStyle = GoogleFonts.montserrat(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      height: 1.11,
      letterSpacing: .9,
      color: Colors.white60,
    );
    return Container(
      color: AppColors.granita, // Colors.black,
      width: 212,
      height: double.infinity,
      // padding: const EdgeInsets.symmetric(vertical: 116),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            RotatedBox(
              quarterTurns: 3,
              child: InkWell(
                onTap: () async {
                  await controller.position.ensureVisible(
                    AppKeys.portfolioKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );

                  ref.read(selectedMenuProvider.notifier).update((state) => 0);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    'PORTFOLIO',
                    style: sideMenuTextStyle.copyWith(
                        color: menuIndex == 0 ? Colors.white : null),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: InkWell(
                onTap: () async {
                  await controller.position.ensureVisible(
                    AppKeys.teamKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );

                  ref.read(selectedMenuProvider.notifier).update((state) => 1);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    'TEAM',
                    style: sideMenuTextStyle.copyWith(
                        color: menuIndex == 1 ? Colors.white : null),
                  ),
                ),
              ),
            ),

            // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: InkWell(
                onTap: () async {
                  await controller.position.ensureVisible(
                    AppKeys.focusKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );

                  ref.read(selectedMenuProvider.notifier).update((state) => 2);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: SelectableText(
                    'FOCUS AREAS',
                    style: sideMenuTextStyle.copyWith(
                        color: menuIndex == 2 ? Colors.white : null),
                  ),
                ),
              ),
            ), // const SizedBox(height: 35),
            RotatedBox(
              quarterTurns: 3,
              child: InkWell(
                onTap: () async {
                  await controller.position.ensureVisible(
                    AppKeys.promiseKey.currentContext
                        ?.findAncestorRenderObjectOfType() as RenderObject,
                    duration: 600.milliseconds,
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );

                  ref.read(selectedMenuProvider.notifier).update((state) => 3);
                },
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Text(
                    'OUR PROMISE',
                    style: sideMenuTextStyle.copyWith(
                        color: menuIndex == 3 ? Colors.white : null),
                  ),
                ),
              ),
            ),
          ]
              .animate(
                  delay: (preTime + 800).milliseconds,
                  interval: 200.milliseconds)
              .fadeIn()
              .scaleY(alignment: Alignment.topCenter),
        ),
      ),
    ).animate(delay: (preTime + 600).milliseconds).slideX(begin: 1, end: 0);
  }
}
