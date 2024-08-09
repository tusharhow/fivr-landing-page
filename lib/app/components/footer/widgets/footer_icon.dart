import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FooterIcons extends StatelessWidget {
  const FooterIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        Image.asset(
          'assets/images/youtube.png',
          width: 48,
          height: 48,
        ),
        Image.asset(
          'assets/images/telegram.png',
          width: 48,
          height: 48,
        ),
        Image.asset(
          'assets/images/instagram.png',
          width: 48,
          height: 48,
        ),
        Image.asset(
          'assets/images/facebook.png',
          width: 48,
          height: 48,
        ),
        Image.asset(
          'assets/images/linkedin.png',
          width: 48,
          height: 48,
        ),
      ]
          .animate(delay: 400.milliseconds, interval: 100.milliseconds)
          .fadeIn()
          .scaleY(),
    );
  }
}
