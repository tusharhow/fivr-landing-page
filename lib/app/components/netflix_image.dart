import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetflixImage extends StatelessWidget {
  const NetflixImage({
    super.key,
    this.height,
  });
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'vectors/netflix.svg',
      height: height ?? 48,
      colorFilter: const ColorFilter.mode(
        Colors.black,
        BlendMode.srcATop,
      ),
    );
  }
}
