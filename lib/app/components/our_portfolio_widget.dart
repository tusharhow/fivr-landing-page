import 'package:fivr_landing_page/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OurPortfolioWidget extends HookConsumerWidget {
  const OurPortfolioWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 130,
            top: size.width * 0.05,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SelectableText(
              'Our portfolio',
              style: GoogleFonts.bebasNeue(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.065,
        ),
        SizedBox(
          height: 2450,
          child: Center(
            child: SelectableText(
              "Portfolio Block",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.vibrantOrange),
            ),
          ),
        )
      ],
    );
  }
}
