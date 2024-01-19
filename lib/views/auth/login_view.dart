import 'package:budgetbuddy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _isHidden = ValueNotifier(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 72.h,
              ),
              TextFormField(
                controller: _emailController,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14.w,
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
                    controller: _passwordController,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.w,
                        ),
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
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 18.w,
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              TextButton(
                onPressed: () {},
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
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
    );
  }
}
