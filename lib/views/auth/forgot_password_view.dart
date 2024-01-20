import 'package:budgetbuddy/constants/app_strings.dart';
import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/utils/custom_auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 69.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppStrings.forgotPasswordTextOne,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 18.w,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                AppStrings.forgotPasswordTextTwo,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 18.w,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 46.h,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomAuthButton(
                buttonName: "Continue",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteNames.forgotPasswordEmailSentView);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
