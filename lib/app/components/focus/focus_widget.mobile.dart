import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../hoverable_container.dart';

class FocusMobileWidget extends StatelessWidget {
  const FocusMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 850,
      child: AnimatedBox(
        detectedKey: "FOCUS-1",
        builder: (con, visible) => visible
            ? Container(
                height: 850,
                color: AppColors.cattleyaOrchid, // const Color(0xff3B0D3C),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: SelectableText(
                        'Our Focus Areas:',
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontSize: 60,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              delay: 200.milliseconds,
                              interval: 100.milliseconds,
                            )
                            .flipV(),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn()
                    .flipV(begin: -.05, perspective: .5)
                    .flipH(begin: .05, perspective: .5),
              )
            : const SizedBox.expand(),
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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      hoverColor: Colors.purple[700],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: 35,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
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
