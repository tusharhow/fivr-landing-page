import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/footer_disclaimer.dart';
import 'widgets/widgets.dart';

class FooterWidgetDesktop extends HookConsumerWidget {
  const FooterWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 1920 / 467,
      child: AnimatedBox(
        detectedKey: "FOOTER",
        builder: (con, visible) => !visible
            ? const SizedBox()
            : ColoredBox(
                color: Colors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 100.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            72.verticalSpace,
                            const FooterTitles(),
                            46.verticalSpace,
                            const FooterIcons(),
                            const FooterDisclaimer(),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: FooterEmailText(),
                    ),
                  ],
                ),
              ).animate().slideY(begin: 1, end: 0),
      ),
    );
  }
}
