import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '/core/theme/app_colors.dart';
import 'app/views/devices/desktop_view.dart';
import 'app/views/devices/mobile_view.dart';
import 'app/views/devices/tablet_view.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      preferDesktop: true,
      builder: (context) => ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (context, child) => MaterialApp(
          title: 'Fivr Landing Page',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.purpleCorallites,
            ),
            useMaterial3: true,
          ),
          home: SelectionArea(
            child: ScreenTypeLayout.builder(
              mobile: (context) => const MobileView(),
              tablet: (context) => const TabletView(),
              desktop: (context) => const DesktopView(),
            ),
          ),
          // home: const Webpage(),
        ),
      ),
    );
  }
}
