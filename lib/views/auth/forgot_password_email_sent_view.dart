import 'package:budgetbuddy/constants/app_image_path.dart';
import 'package:budgetbuddy/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordEmailSentView extends StatefulWidget {
  const ForgotPasswordEmailSentView({super.key});

  @override
  State<ForgotPasswordEmailSentView> createState() =>
      _ForgotPasswordEmailSentViewState();
}

class _ForgotPasswordEmailSentViewState
    extends State<ForgotPasswordEmailSentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 27.w,
            ),
            child: Column(
              children: [
                Image.asset(AppImagePath.emailSent),
                Text(
                  AppStrings.emailOnTheWay,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 20.w,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppStrings.passwordResetInstruction,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16.w,
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 190.h,
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
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back to Login",
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
      ),
    );
  }
}
