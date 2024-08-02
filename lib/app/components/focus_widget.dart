import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/theme/app_colors.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hoverable_container.dart';

class FocusWidget extends StatelessWidget {
  const FocusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AspectRatio(
      aspectRatio: 1920 / 800,
      child: AnimatedBox(
        detectedKey: "FOCUS",
        builder: (con, visible) => Row(
          key: AppKeys.focusKey,
          children: [
            Expanded(
              flex: 4,
              child: !visible
                  ? const SizedBox()
                  : Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                      .animate()
                      .fadeIn()
                      .flipV(begin: -.05, perspective: .5)
                      .flipH(begin: -.05, perspective: .5),
            ),
            10.horizontalSpace,
            Expanded(
              flex: 6,
              child: !visible
                  ? const SizedBox()
                  : ColoredBox(
                      color:
                          AppColors.cattleyaOrchid, // const Color(0xff3B0D3C),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          30.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 80.w),
                            child: SelectableText(
                              'Our Focus Areas:',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: 80.sp,
                              ),
                            ),
                          ),
                          22.verticalSpace,
                          Padding(
                            padding: EdgeInsets.only(left: 215.w, right: 135.w),
                            child: Column(
                              children: [
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/box.svg',
                                  'Logistics:',
                                  'Revolutionizing supply chain management with AI-driven analytics and predictive modeling.',
                                ),
                                buildDivider(size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/health.svg',
                                  'Healthcare:',
                                  'Empowering providers and patients with telemedicine platforms and personalized care.',
                                ),
                                buildDivider(size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/finance.svg',
                                  'Finance:',
                                  'Securing transactions and financial data with blockchain technology and advanced cybersecurity.',
                                ),
                                buildDivider(size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/education.svg',
                                  'Education:',
                                  'Shaping the future of learning through immersive educational technologies and e-learning tools.',
                                ),
                              ]
                                  .animate(
                                    delay: 100.milliseconds,
                                    interval: 100.milliseconds,
                                  )
                                  .flipV(),
                            ),
                          ),
                        ],
                      ),
                    )
                      .animate()
                      .fadeIn()
                      .flipV(begin: -.05, perspective: .5)
                      .flipH(begin: .05, perspective: .5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDivider(Size size) {
    return Divider(
      color: Colors.white30,
      thickness: 1,
      indent: size.width * 0.01,
      endIndent: size.width * 0.014,
      height: 20,
    );
  }

  Widget buildHoverableFocusArea(
    BuildContext context,
    String iconPath,
    String title,
    String description,
  ) {
    return HoverableContainer(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
      hoverColor: Colors.purple[700],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 50.w,
            width: 50.w,
          ),
          25.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 35.sp,
                  ),
                ),
                10.verticalSpace,
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
