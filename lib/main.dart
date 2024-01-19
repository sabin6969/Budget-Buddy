import 'package:budgetbuddy/constants/app_theme.dart';
import 'package:budgetbuddy/constants/rotutes.dart';
import 'package:budgetbuddy/views/boading/boading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

late Size size;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(376, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "Budget Buddy",
          debugShowCheckedModeBanner: false,
          home: const BoadingView(),
          theme: appTheme,
          onGenerateRoute: Routes.generateRoutes,
        );
      },
    );
  }
}
