import 'package:budgetbuddy/constants/app_image_path.dart';
import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/utils/custom_auth_button.dart';
import 'package:budgetbuddy/view_models/signup_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ValueNotifier<bool> _isHidden = ValueNotifier(true);
  final ValueNotifier<bool> _isChecked = ValueNotifier(true);
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SignUpViewModel signUpViewModel =
        Provider.of<SignUpViewModel>(context);
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Sign Up"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
          ),
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                SizedBox(
                  height: 42.h,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.w,
                      ),
                  validator: (value) => signUpViewModel.validateName(
                    value!,
                  ),
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      CupertinoIcons.person_alt_circle,
                      size: 26.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 12.w,
                      ),
                  validator: (value) => signUpViewModel.validateEmail(value!),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 26.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ValueListenableBuilder(
                  valueListenable: _isHidden,
                  builder: (context, value, child) {
                    return TextFormField(
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.w,
                          ),
                      validator: (value) =>
                          signUpViewModel.validatePassword(value!),
                      obscureText: value,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(
                          CupertinoIcons.lock,
                          size: 26.w,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _isHidden.value = !_isHidden.value;
                          },
                          icon: value
                              ? Icon(
                                  Icons.visibility_outlined,
                                  size: 26.w,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  size: 26.w,
                                ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 17.h,
                ),
                ValueListenableBuilder(
                  valueListenable: _isChecked,
                  builder: (context, value, child) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _isChecked.value,
                      onChanged: (value) {
                        _isChecked.value = !_isChecked.value;
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "By signing up, you agree to the",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF91919F),
                                  ),
                            ),
                            TextSpan(
                              text: " terms of Service and Privacy Policy",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    fontSize: 14.w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomAuthButton(
                  buttonName: "Sign Up",
                  onPressed: () {
                    signUpViewModel.signUp(
                      _globalKey,
                      _isChecked.value,
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Or with",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 14.w,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF91919F),
                      ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomAuthButton(
                  buttonName: "Sign Up with Google",
                  onPressed: () {},
                  logoPath: AppImagePath.googleLogo,
                ),
                SizedBox(
                  height: 19.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14.w,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
