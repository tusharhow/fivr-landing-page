import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OurPortfolioMobileTabletWidget extends HookConsumerWidget {
  const OurPortfolioMobileTabletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
              key: AppKeys.portfolioKey,
              'Our portfolio',
              style: GoogleFonts.bebasNeue(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
