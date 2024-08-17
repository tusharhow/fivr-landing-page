import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';
import '../../netflix_image.dart';
import '../../technology_text.dart';

class NetflixTechWidget extends StatelessWidget {
  const NetflixTechWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final device = getDeviceType(MediaQuery.sizeOf(context));
    return Container(
      color: AppColors.primroseYellow, // const Color(0xff288B55),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          switch (device) {
            DeviceScreenType.mobile => const _ForMobile(),
            DeviceScreenType.tablet => const _ForTablet(),
            _ => const SizedBox(),
          },
          Padding(
            padding: getValueForScreenType(
                context: context,
                mobile: const EdgeInsets.only(
                  left: 20,
                  right: 12,
                  bottom: 42,
                ),
                tablet: const EdgeInsets.only(
                  left: 40,
                  right: 52,
                  bottom: 79,
                )),
            child: AutoSizeText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: TextStyle(
                fontSize: getValueForScreenType(
                  context: context,
                  mobile: 18,
                  tablet: 28,
                ),
              ),
              maxFontSize: getValueForScreenType(
                context: context,
                mobile: 18,
                tablet: 28,
              ),
              minFontSize: 6,
              maxLines: getValueForScreenType(
                context: context,
                mobile: 6,
                tablet: 5,
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 300.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: .05, perspective: .5);
  }
}

class _ForMobile extends StatelessWidget {
  const _ForMobile();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36),
          Align(
            alignment: Alignment.centerRight,
            child: NetflixImage(),
          ),
          SizedBox(height: 120),
          TechnologyText(fontSize: 60),
        ],
      ),
    );
  }
}

class _ForTablet extends StatelessWidget {
  const _ForTablet();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40)
          .copyWith(bottom: 250, top: 80),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: TechnologyText(fontSize: 85)),
          Expanded(child: NetflixImage(height: 67)),
        ],
      ),
    );
  }
}
