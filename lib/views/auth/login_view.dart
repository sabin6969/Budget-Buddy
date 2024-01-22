import 'package:budgetbuddy/constants/app_image_path.dart';
import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/main.dart';
import 'package:budgetbuddy/utils/custom_auth_button.dart';
import 'package:budgetbuddy/view_models/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _isHidden = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _isHidden.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel =
        Provider.of<LoginViewModel>(context, listen: false);
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF7F3DFF),
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 16.w,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 1.h),
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 72.h,
                ),
                TextFormField(
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => loginViewModel.validateEmail(value!),
                  controller: _emailController,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 12.w,
                        fontWeight: FontWeight.w500,
                      ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 26.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                ValueListenableBuilder(
                  valueListenable: _isHidden,
                  builder: (context, value, child) {
                    return TextFormField(
                      focusNode: _passwordFocusNode,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.w,
                          ),
                      validator: (value) =>
                          loginViewModel.validatePassword(value!),
                      controller: _passwordController,
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
                  height: 50.h,
                ),
                CustomAuthButton(
                  buttonName: "Login",
                  onPressed: () {
                    loginViewModel.login(
                      globalKey: _globalKey,
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context,
                    );
                  },
                ),
                SizedBox(
                  height: 33.h,
                ),
                CustomAuthButton(
                  buttonName: "Sign Up with Google",
                  onPressed: () {},
                  logoPath: AppImagePath.googleLogo,
                ),
                SizedBox(
                  height: 33.h,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.forgotPasswordView);
                  },
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 15.w,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet?",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 14.w,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF91919F),
                          ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.signupView);
                      },
                      child: Text(
                        "Sign Up",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14.w,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
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
