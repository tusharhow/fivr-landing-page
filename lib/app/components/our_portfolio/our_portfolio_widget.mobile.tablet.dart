import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OurPortfolioMobileTabletWidget extends HookConsumerWidget {
  const OurPortfolioMobileTabletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedBox(
      detectedKey: 'PORTFOLIO-MAIN',
      builder: (p0, v) => ColoredBox(
        color: Colors.black38,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: getValueForScreenType(
                context: context,
                mobile: const EdgeInsets.only(
                  left: 20,
                  top: 120,
                  bottom: 30,
                ),
                tablet: const EdgeInsets.only(
                  left: 46,
                  top: 154,
                  bottom: 30,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Our portfolio',
                  key: AppKeys.portfolioKey,
                  style:
                      GoogleFonts.bebasNeue(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            // SizedBox(
            //   height: 2450,
            //   child: Center(
            //     child: SelectableText(
            //       "Portfolio Block",
            //       style: Theme.of(context)
            //           .textTheme
            //           .headlineLarge!
            //           .copyWith(color: AppColors.vibrantOrange),
            //     ),
            //   ),
            // ),

            // !v ? const SizedBox() : const EyeWidget(),

            // vGap(context),

            // v == false ? const SizedBox() : const NetflixTechWidget(),

            // vGap(context),

            //. 2nd row
            // AspectRatio(
            //   // height: MediaQuery.of(context).size.height * 0.7,
            //   aspectRatio: 1920 / 700,
            //   child: AnimatedBox(
            //     detectedKey: "Portfolio mid",
            //     builder: (con, visible) => Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Expanded(
            //           flex: 59,
            //           child:
            //               !visible ? const SizedBox() : const FinanceWidget(),
            //         ),
            //         20.horizontalSpace,
            //         Expanded(
            //           flex: 39,
            //           child: Column(
            //             children: [
            //               !visible
            //                   ? const SizedBox()
            //                   : const Expanded(child: PixiJS1()),
            //               20.verticalSpace,
            //               !visible
            //                   ? const SizedBox()
            //                   : const Expanded(child: PixiJS2()),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // 20.verticalSpace,

            // //. 3rd row
            // AspectRatio(
            //   // height: MediaQuery.of(context).size.height * 0.6,
            //   aspectRatio: 1920 / 700,
            //   child: AnimatedBox(
            //     detectedKey: 'PORTFOLIO BOTTOM',
            //     builder: (con, visible) => Row(
            //       children: [
            //         Expanded(
            //             flex: 40,
            //             child: !visible ? const SizedBox() : const Mosque()),
            //         20.horizontalSpace,
            //         Expanded(
            //             flex: 60,
            //             child: !visible ? const SizedBox() : const Road()),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
