import 'package:fivr_landing_page/app/application/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '/core/theme/app_colors.dart';
import 'app/views/devices/desktop_view.dart';
import 'app/views/devices/mobile_view.dart';
import 'app/views/devices/tablet_view.dart';
import 'app/views/responsive/responsive.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        generalProvider.overrideWith((ref) => true),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fivr Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.purpleCorallites),
        useMaterial3: true,
      ),
      home: const Responsive(
        mobile: MobileView(),
        tablet: TabletView(),
        desktop: DesktopView(),
      ),
      // home: const Webpage(),
    );
  }
}
