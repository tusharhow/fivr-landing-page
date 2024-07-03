import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalTextMenu extends StatelessWidget {
  const VerticalTextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'PORTFOLIO',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 35),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'TEAM',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 35),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'OUR PROMISE',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
        ),
        const SizedBox(height: 35),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            'FOCUS AREAS',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 11,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }
}