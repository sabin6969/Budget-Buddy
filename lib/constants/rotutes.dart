import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/views/add_expense_view.dart';
import 'package:budgetbuddy/views/auth/forgot_password_email_sent_view.dart';
import 'package:budgetbuddy/views/auth/forgot_password_view.dart';
import 'package:budgetbuddy/views/auth/login_view.dart';
import 'package:budgetbuddy/views/auth/signup_view.dart';
import 'package:budgetbuddy/views/home_view.dart';
import 'package:budgetbuddy/views/profile_view.dart';
import 'package:budgetbuddy/views/settings_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RouteNames.forgotPasswordView:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordView(),
        );
      case RouteNames.forgotPasswordEmailSentView:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordEmailSentView(),
        );
      case RouteNames.signupView:
        return MaterialPageRoute(builder: (context) => const SignupView());
      case RouteNames.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RouteNames.addExpenseView:
        return MaterialPageRoute(builder: (context) => const AddExpenseView());
      case RouteNames.profileView:
        return MaterialPageRoute(builder: (context) {
          return const ProfileView();
        });
      case RouteNames.settingsView:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
