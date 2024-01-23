import 'package:budgetbuddy/constants/app_theme.dart';
import 'package:budgetbuddy/constants/rotutes.dart';
import 'package:budgetbuddy/firebase_options.dart';
import 'package:budgetbuddy/view_models/add_expense_view_model.dart';
import 'package:budgetbuddy/view_models/forgot_password_view_model.dart';
import 'package:budgetbuddy/view_models/login_view_model.dart';
import 'package:budgetbuddy/view_models/signup_view_model.dart';
import 'package:budgetbuddy/views/boarding/boarding_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => LoginViewModel(),
            ),
            ChangeNotifierProvider(
              create: (context) => ForgotPasswordViewModel(),
            ),
            ChangeNotifierProvider(
              create: (context) => SignUpViewModel(),
            ),
            ChangeNotifierProvider(
              create: (context) => AddExpenseViewModel(),
            )
          ],
          builder: (context, child) {
            return MaterialApp(
              title: "Budget Buddy",
              debugShowCheckedModeBanner: false,
              home: const BoardingView(),
              theme: appTheme,
              onGenerateRoute: Routes.generateRoutes,
            );
          },
        );
      },
    );
  }
}
