import 'package:fivr_landing_page/app/components/technology_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/core.dart';

class Road extends HookConsumerWidget {
  const Road({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primroseYellow, // const Color(0xff288B55),
        image: DecorationImage(
          image: AssetImage('assets/images/road.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.all(getValueForScreenType(
        context: context,
        mobile: 20,
        tablet: 40,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 13),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/segment logo small.png',
              height: 68.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: getValueForScreenType(
              context: context,
              mobile: 150,
              tablet: 220,
            ),
          ),
          TechnologyText(
            fontSize: getValueForScreenType(
              context: context,
              mobile: 60,
              tablet: 85,
            ),
            textColor: Colors.white,
          ),
          Padding(
            padding: getValueForScreenType(
              context: context,
              mobile: const EdgeInsets.only(top: 9, bottom: 18),
              tablet: const EdgeInsets.only(top: 8, bottom: 60),
            ),
            child: const SelectableText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    )
        .animate(delay: 200.milliseconds)
        .fadeIn()
        .flipV(begin: -.05, perspective: .5)
        .flipH(begin: .05, perspective: .5);
  }
}
