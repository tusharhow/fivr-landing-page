import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.only(left: 34, top: 20, bottom: 12),
        tablet: const EdgeInsets.only(left: 41, top: 22),
        desktop: EdgeInsets.only(left: 98.w, top: 28.w),
      ),
      child: Image.asset(
        'assets/images/FivR.png',
        width: 108,
        height: 39.27,
      ),
    );
  }
}
