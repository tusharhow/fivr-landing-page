import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSubtitle extends StatelessWidget {
  const HeroSubtitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        desktop: EdgeInsets.only(left: 72.w, right: 850.w),
        tablet: const EdgeInsets.only(left: 40, right: 70),
        mobile: const EdgeInsets.symmetric(horizontal: 28),
      ),
      child: SelectableText.rich(
        TextSpan(
          text: '             ',
          children: [
            const TextSpan(
              text: 'At FivR, we believe in the power of technology ',
            ),
            TextSpan(
              text: 'to transform lives and industries.',
              style: GoogleFonts.roboto(
                color: Colors.white,
              ),
            ),
          ],
        ),
        style: GoogleFonts.roboto(
          fontSize: getValueForScreenType(
            context: context,
            desktop: 38.sp,
            tablet: 28,
            mobile: 24,
          ),
        ),
      ),
    );
  }
}
