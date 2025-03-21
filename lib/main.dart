import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Views/Bottombar_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 900) {
        // Desktop or Large Screen Layout
        return buildWideScreenLayout();
      } else {
        // Mobile or Tablet Layout
        return buildMobileLayout();
      }
    });
  }

  /// 🖥️ Desktop / Large Screen Layout
  Widget buildWideScreenLayout() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Desktop Demo',
          home: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 900),
              child: CustomBottomNavBar(),
            ),
          ),
        );
      },
    );
  }

  Widget buildMobileLayout() {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Mobile Demo',
          home: CustomBottomNavBar(),
        );
      },
    );
  }
}
