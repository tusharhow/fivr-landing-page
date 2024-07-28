import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      child: SizedBox(
        height: 800,
        child: Row(
          children: [
            Flexible(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img3.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: size.width * .6,
              color: const Color(0xff3B0D3C),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.07,
                      left: size.width * 0.05,
                    ),
                    child: Text(
                      'Our Focus Areas:',
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: size.width * 0.025,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.09,
                    ),
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
                            delay: 800.milliseconds,
                            interval: 200.milliseconds,
                          )
                          .flipV(),
                    ),
                  ),
                ],
              ),
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
    Size size = MediaQuery.sizeOf(context);

    return HoverableContainer(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.bebasNeue(
                    color: Colors.white,
                    fontSize: size.width * 0.015,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: size.width * 0.0085,
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
