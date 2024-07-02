import 'package:fivr_landing_page/app/views/devices/desktop_view.dart';
import 'package:fivr_landing_page/app/views/devices/mobile_view.dart';
import 'package:fivr_landing_page/app/views/devices/tablet_view.dart';
import 'package:fivr_landing_page/app/views/responsive/responsive.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Responsive(
        mobile: MobileView(),
        tablet: TabletView(),
        desktop: DesktopView(),
      ),
    );
  }
}
