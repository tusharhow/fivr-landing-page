import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hover_animation/hover_animation.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/core.dart';

class JoinUsWidgetMobileTablet extends HookConsumerWidget {
  const JoinUsWidgetMobileTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: getValueForScreenType(
        context: context,
        mobile: 414 / 676,
        tablet: 830 / 630,
      ),
      child: AnimatedBox(
        detectedKey: 'JOIN US',
        builder: (con, visible) => !visible
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // const SizedBox(height: 90),
                    SelectableText(
                      'Join us on our journey to redefine the technological landscape.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 55,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    )
                        .animate(delay: 300.milliseconds)
                        .fadeIn()
                        .scaleX(alignment: Alignment.center),

                    Padding(
                      padding: getValueForScreenType(
                        context: context,
                        mobile: const EdgeInsets.only(top: 28, bottom: 50),
                        tablet: const EdgeInsets.only(top: 36, bottom: 58),
                      ),
                      child: SelectableText(
                        'Together, we can build a smarter, more connected world.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(fontSize: 22),
                      ),
                    ),

                    HoverAnimation(
                      primaryColor: AppColors.granita, // Colors.black,
                      hoverColor: AppColors
                          .purpleCorallites, // const Color(0xff2051FF),
                      size: const Size(180, 60),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      onTap: () {},
                      child: Center(
                        child: Text(
                          'DIVE DIPPER',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                      ),
                    )
                        .animate()
                        .scaleX(
                            alignment: Alignment.center,
                            duration: 600.milliseconds)
                        .slideY(
                          begin: 1,
                          end: 0,
                        )
                        .fadeIn(),
                    // SizedBox(height: 72.w)
                  ],
                ),
              ),
      ),
    );
  }
}
