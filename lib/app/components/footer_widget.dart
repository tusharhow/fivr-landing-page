import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FooterWidget extends HookConsumerWidget {
  const FooterWidget({super.key});

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
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 100.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            72.verticalSpace,
                            const FooterTitles(),
                            46.verticalSpace,
                            const FooterIcons(),
                            120.verticalSpace,
                            SelectableText(
                              '© 2024FivR. ALL RIGHTS',
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                            ),
                            8.verticalSpace,
                            SelectableText(
                              'Privacy  |  TERMS & CONDITIONS',
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 150.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            60.verticalSpace,
                            SelectableText(
                              'Sign up for our email list',
                              style: GoogleFonts.bebasNeue(
                                fontSize: 45.sp,
                                color: Colors.white,
                              ),
                            )
                                .animate(delay: 300.milliseconds)
                                .fadeIn()
                                .scaleX(alignment: Alignment.center),
                            40.verticalSpace,
                            SizedBox(
                              width: 540.w,
                              child: Theme(
                                data: ThemeData(primaryColor: Colors.white),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 25.sp,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 12.h),
                                    hintText: 'Enter You Email',
                                    hintStyle: TextStyle(
                                      fontSize: 25.sp,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: FilledButton(
                                      style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                        ),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'SENT',
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 20.sp),
                                      ),
                                    ),
                                  ),
                                )
                                    .animate(delay: 300.milliseconds)
                                    .fadeIn()
                                    .scaleY(alignment: Alignment.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().slideY(begin: 1, end: 0),
      ),
    );
  }
}

class FooterIcons extends StatelessWidget {
  const FooterIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/youtube.png',
          width: 48,
          height: 48,
        ),
        8.horizontalSpace,
        Image.asset(
          'assets/images/telegram.png',
          width: 48,
          height: 48,
        ),
        8.horizontalSpace,
        Image.asset(
          'assets/images/instagram.png',
          width: 48,
          height: 48,
        ),
        8.horizontalSpace,
        Image.asset(
          'assets/images/facebook.png',
          width: 48,
          height: 48,
        ),
        8.horizontalSpace,
        Image.asset(
          'assets/images/linkedin.png',
          width: 48,
          height: 48,
        ),
        8.horizontalSpace,
      ]
          .animate(delay: 400.milliseconds, interval: 100.milliseconds)
          .fadeIn()
          .scaleY(),
    );
  }
}

class FooterTitles extends StatelessWidget {
  const FooterTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SelectableText(
          'Focus Areas',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        80.horizontalSpace,
        const SelectableText(
          'Our Promise',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        80.horizontalSpace,
        const SelectableText(
          'Team',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        80.horizontalSpace,
        const SelectableText(
          'Portfolio',
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
        80.horizontalSpace,
      ]
          .animate(delay: 400.milliseconds, interval: 100.milliseconds)
          .fadeIn()
          .slideX(),
    );
  }
}
