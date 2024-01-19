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
    ),
  ),
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 16.w,
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
