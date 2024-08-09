import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/app/components/footer/widgets/footer_disclaimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/widgets.dart';

class FooterWidgetMobileTablet extends HookConsumerWidget {
  const FooterWidgetMobileTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 570,
      ),
      child: AnimatedBox(
        detectedKey: "FOOTER",
        tigerPoint: 0,
        builder: (con, visible) => !visible
            ? const SizedBox()
            : Container(
                padding: const EdgeInsets.all(20),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 48),
                    SelectableText(
                      'Sign up for our email list',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    )
                        .animate(delay: 300.milliseconds)
                        .fadeIn()
                        .scaleX(alignment: Alignment.center),
                    const SizedBox(height: 22),
                    Theme(
                      data: ThemeData(primaryColor: Colors.white),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                          hintText: 'Enter You Email',
                          hintStyle: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                          suffixIcon: FilledButton(
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text(
                              'SENT',
                              style: GoogleFonts.bebasNeue(fontSize: 20),
                            ),
                          ),
                        ),
                      )
                          .animate(delay: 300.milliseconds)
                          .fadeIn()
                          .scaleY(alignment: Alignment.center),
                    ),
                    const SizedBox(height: 70),
                    const FooterTitles(),
                    const SizedBox(height: 44),
                    const FooterIcons(),
                    const SizedBox(height: 80),
                    const FooterDisclaimer(),
                    const SizedBox(height: 40),
                  ],
                ),
              ).animate().slideY(begin: 1, end: 0),
      ),
    );
  }
}
