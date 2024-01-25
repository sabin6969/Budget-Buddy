import 'package:budgetbuddy/constants/app_strings.dart';
import 'package:budgetbuddy/utils/custom_auth_button.dart';
import 'package:budgetbuddy/view_models/forgot_password_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordViewModel forgotPasswordViewModel =
        Provider.of<ForgotPasswordViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
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
              Form(
                key: _globalKey,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.w,
                      ),
                  validator: (value) =>
                      forgotPasswordViewModel.validateEmail(value!),
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomAuthButton(
                buttonName: "Continue",
                onPressed: () {
                  forgotPasswordViewModel.sendResetLink(
                    globalKey: _globalKey,
                    context: context,
                    email: _emailController.text,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
