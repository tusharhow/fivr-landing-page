import 'package:flutter/material.dart';

class FooterDisclaimer extends StatelessWidget {
  const FooterDisclaimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '© 2024FivR. ALL RIGHTS',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 8),
        SelectableText(
          'Privacy  |  TERMS & CONDITIONS',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
