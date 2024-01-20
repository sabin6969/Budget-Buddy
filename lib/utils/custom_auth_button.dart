import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  final String buttonName;
  final void Function() onPressed;
  final String? logoPath;
  const CustomAuthButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: logoPath == null
            ? const MaterialStatePropertyAll(
                Color(0xFF7F3DFF),
              )
            : MaterialStatePropertyAll(
                Colors.grey.shade200,
              ),
        elevation: logoPath == null
            ? const MaterialStatePropertyAll(0)
            : const MaterialStatePropertyAll(2),
        fixedSize: MaterialStatePropertyAll(
          Size(
            343.w,
            56.h,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
        ),
      ),
      onPressed: onPressed,
      child: logoPath == null
          ? Text(
              buttonName,
              style: TextStyle(
                fontSize: 18.w,
                color: Colors.grey.shade200,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  logoPath!,
                  height: 32.h,
                  width: 32.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  buttonName,
                  style: TextStyle(
                    fontSize: 18.w,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
    );
  }
}
