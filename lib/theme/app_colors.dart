import 'package:flutter/material.dart';

enum StatusEnum { SUCCESS, ERROR, WARNING, INFO, DISABLED, DISABLED_BUTTON }

class AppColors {
  AppColors._(); //private constructor

  static Color primaryColor = Color(0xFF335EF7);
  static Map<int, Color> darkColor = {
    1: const Color(0xFF181A20),
    2: const Color(0xFF1F222A),
    3: const Color(0xFF35383F),
  };
  static Color lightColor = Colors.white;
  static Map<int, Color> greyScaleColor = {
    50: const Color(0xFFFAFAFA),
    100: const Color(0xFFF5F5F5),
    200: const Color(0xFFEEEEEE),
    300: const Color(0xFFE0E0E0),
    400: const Color(0xFFBDBDBD),
    500: const Color(0xFF9E9E9E),
    600: const Color(0xFF757575),
    700: const Color(0xFF616161),
    800: const Color(0xFF424242),
    900: const Color(0xFF212121),
  };
  static Map<StatusEnum, Color> statusColor = {
    StatusEnum.SUCCESS: const Color(0xFF4ADE80),
    StatusEnum.INFO: const Color(0xFF246BFD),
    StatusEnum.WARNING: const Color(0xFFFACC15),
    StatusEnum.ERROR: const Color(0xFFF75555),
    StatusEnum.DISABLED: const Color(0xFFD8D8D8),
    StatusEnum.DISABLED_BUTTON: const Color(0xFF4360C9),
  };
}