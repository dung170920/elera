import 'package:elera/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextStyle on TextStyle {
  static TextStyle h1([Color? color]) => TextStyle(
      fontSize: 48.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
  static TextStyle h2([Color? color]) => TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
  static TextStyle h3([Color? color]) => TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
  static TextStyle h4([Color? color]) => TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
  static TextStyle h5([Color? color]) => TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
  static TextStyle h6([Color? color]) => TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.2,
      color: color ?? AppColors.greyScaleColor[900]);
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
