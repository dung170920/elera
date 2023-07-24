import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  static final DEFAULT_RADIUS = 16.0;
  static final DEFAULT_LARGE_RADIUS = 32.0;
  static final DEFAULT_SMALL_RADIUS = 8.0;

  static final snackbarShadow = [
    BoxShadow(
      color: AppColors.shadowColor.withOpacity(0.08),
      offset: const Offset(-5, 2),
      blurRadius: 20,
    )
  ];

  static Map<int, List<BoxShadow>> cardShadow = {
    1: [
      BoxShadow(
        blurRadius: 60,
        offset: Offset(0, 4),
        color: AppColors.shadowColor.withOpacity(0.08),
      )
    ],
    2: [
      BoxShadow(
        blurRadius: 60,
        offset: Offset(0, 4),
        color: AppColors.shadowColor.withOpacity(0.05),
      )
    ],
    3: [
      BoxShadow(
        blurRadius: 100,
        offset: Offset(0, 20),
        color: AppColors.shadowColor.withOpacity(0.08),
      )
    ],
    4: [
      BoxShadow(
        blurRadius: 60,
        offset: Offset(-2, 5),
        color: AppColors.shadowColor.withOpacity(0.05),
      )
    ],
  };

  static Map<int, List<BoxShadow>> buttonShadow = {
    1: [
      BoxShadow(
        blurRadius: 24,
        offset: Offset(4, 8),
        color: AppColors.primaryColor.withOpacity(0.25),
      )
    ],
    2: [
      BoxShadow(
        blurRadius: 32,
        offset: Offset(4, 12),
        color: AppColors.primaryColor.withOpacity(0.20),
      )
    ],
    3: [
      BoxShadow(
        blurRadius: 32,
        offset: Offset(4, 16),
        color: AppColors.primaryColor.withOpacity(0.20),
      )
    ],
  };
}
