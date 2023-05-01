import 'package:elera/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextStyle on TextStyle {
  static TextStyle get h1 => TextStyle(
      fontSize: 48.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle get h2 => TextStyle(
      fontSize: 40.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle get h3 => TextStyle(
      fontSize: 32.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle get h4 => TextStyle(
      fontSize: 24.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle get h5 => TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle get h6 => TextStyle(
      fontSize: 18.sp, fontWeight: FontWeight.bold, letterSpacing: 0.2);
  static TextStyle bodyXLarge([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 18.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.greyScaleColor[900],
        letterSpacing: 0.2,
      );
  static TextStyle bodyLarge([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 16.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.greyScaleColor[900],
        letterSpacing: 0.2,
      );
  static TextStyle bodyMedium([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 14.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.greyScaleColor[900],
        letterSpacing: 0.2,
      );
  static TextStyle bodySmall([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 12.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.greyScaleColor[900],
        letterSpacing: 0.2,
      );
  static TextStyle bodyXSmall([FontWeight? weight, Color? color]) => TextStyle(
        fontSize: 10.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: color ?? AppColors.greyScaleColor[900],
        letterSpacing: 0.2,
      );
}
