import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TechnologyText extends StatelessWidget {
  const TechnologyText({
    super.key,
    this.textColor,
    this.fontSize,
  });

  final Color? textColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      'Technology',
      style: GoogleFonts.bebasNeue(
        fontSize: fontSize ?? 60,
        letterSpacing: .5,
        color: textColor,
        height: 1.4,
      ),
      maxLines: 1,
    );
  }
}
