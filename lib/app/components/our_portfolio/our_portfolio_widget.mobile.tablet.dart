import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/utils/app_keys.dart';

class OurPortfolioMobileTabletWidget extends HookConsumerWidget {
  const OurPortfolioMobileTabletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      key: AppKeys.portfolioKey,
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(
          left: 20,
          top: 130,
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
        child: AutoSizeText(
          'Our portfolio',
          style: GoogleFonts.bebasNeue(
            fontSize: 60,
            color: Colors.white,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
