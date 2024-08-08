import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hover_animation/hover_animation.dart';

import '../../../core/core.dart';

class JoinUsWidgetDesktop extends HookConsumerWidget {
  const JoinUsWidgetDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return AspectRatio(
      aspectRatio: 1952 / 715,
      child: AnimatedBox(
        detectedKey: 'JOIN US',
        builder: (con, visible) => !visible
            ? const SizedBox()
            : Column(
                children: [
                  SizedBox(height: 160.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * .14),
                    child: SelectableText(
                      'Join us on our journey to redefine the technological landscape.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 80.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    )
                        .animate(delay: 300.milliseconds)
                        .fadeIn()
                        .scaleX(alignment: Alignment.center),
                  ),
                  SizedBox(height: 20.w),
                  SelectableText(
                    'Together, we can build a smarter, more connected world.',
                    style: GoogleFonts.roboto(fontSize: 22.sp),
                  ),
                  SizedBox(height: 56.w),
                  HoverAnimation(
                    primaryColor: AppColors.granita, // Colors.black,
                    hoverColor:
                        AppColors.purpleCorallites, // const Color(0xff2051FF),
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
                          fontSize: 24.sp,
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
                  SizedBox(height: 72.w)
                ],
              ),
      ),
    );
  }
}
