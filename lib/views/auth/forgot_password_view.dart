import 'package:budgetbuddy/constants/app_strings.dart';
import 'package:budgetbuddy/constants/route_names.dart';
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
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(
                    Color(0xFF7F3DFF),
                  ),
                  fixedSize: MaterialStatePropertyAll(
                    Size(
                      343.w,
                      56.h,
                    ),
                  ),
                  elevation: const MaterialStatePropertyAll(0),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.forgotPasswordEmailSentView,
                  );
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18.w,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
