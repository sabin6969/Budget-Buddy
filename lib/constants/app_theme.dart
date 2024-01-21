import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF7F3DFF),
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
    ),
  ),
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: TextStyle(
      fontSize: 11.w,
      color: Colors.black,
      fontWeight: FontWeight.normal,
    ),
    hintStyle: TextStyle(
      fontSize: 14.w,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF91919F),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        5.w,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        5.w,
      ),
    ),
  ),
);
