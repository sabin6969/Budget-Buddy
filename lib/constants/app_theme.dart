import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  textTheme: TextTheme(
      // bodySmall for captions
      bodySmall: GoogleFonts.poppins(
        fontSize: 18.w,
        color: Colors.black,
      ),

      // bodyMedium for text button
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16.w,
        color: Colors.black,
      ),

      // for title
      labelMedium: GoogleFonts.poppins(
        fontSize: 26.w,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),

      // for subtitle
      labelSmall: GoogleFonts.poppins(
        fontSize: 14.w,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      )),
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(
        Colors.black,
      ),
      fixedSize: MaterialStatePropertyAll(
        Size(40, 40),
      ),
    ),
  ),
);
