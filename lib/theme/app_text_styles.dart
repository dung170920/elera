import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

extension AppTextStyles on TextStyle {
  static TextStyle h1([Color? color]) => TextStyle(
        fontSize: 48.sp,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
        color: color,
      );
  static TextStyle h2([Color? color]) => TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
      );
  static TextStyle h3([Color? color]) => TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
      );
  static TextStyle h4([Color? color]) => TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
      );
  static TextStyle h5([Color? color]) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
      );
  static TextStyle h6([Color? color]) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
      );
  static TextStyle bodyXLarge([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 18.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
      );
  static TextStyle bodyLarge([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 16.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
      );
  static TextStyle bodyMedium([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 14.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
      );
  static TextStyle bodySmall([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 12.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
      );
  static TextStyle bodyXSmall([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 10.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        letterSpacing: 0.2,
      );
}
