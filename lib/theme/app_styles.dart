import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';

enum StatusEnum {
  SUCCESS(const Color(0xFF4ADE80), MyIcons.solidCheckSquare),
  ERROR(const Color(0xFFF75555), MyIcons.solidTimesSquare),
  WARNING(const Color(0xFFFACC15), MyIcons.solidExclamationSquare),
  INFO(const Color(0xFF246BFD), MyIcons.solidQuestionSquare),
  DEFAULT(const Color(0xFF757575)),
  DISABLED(const Color(0xFFD8D8D8)),
  DISABLED_BUTTON(const Color(0xFF4360C9));

  final Color color;
  final IconData? icon;

  const StatusEnum(this.color, [this.icon]);
}

class AppStyles {
  AppStyles._();

  static final DEFAULT_RADIUS = 16.0;
  static final DEFAULT_LARGE_RADIUS = 32.0;
  static final DEFAULT_SMALL_RADIUS = 8.0;

  static Map<int, BoxShadow> cardShadow = {
    1: BoxShadow(
      blurRadius: 60,
      offset: Offset(0, 4),
      color: AppColors.shadowColor.withOpacity(0.08),
    ),
    2: BoxShadow(
      blurRadius: 60,
      offset: Offset(0, 4),
      color: AppColors.shadowColor.withOpacity(0.05),
    ),
    3: BoxShadow(
      blurRadius: 100,
      offset: Offset(0, 20),
      color: AppColors.shadowColor.withOpacity(0.08),
    ),
  };

  static Map<int, BoxShadow> buttonShadow = {
    1: BoxShadow(
      blurRadius: 24,
      offset: Offset(4, 8),
      color: AppColors.primaryColor.withOpacity(0.25),
    ),
    2: BoxShadow(
      blurRadius: 32,
      offset: Offset(4, 12),
      color: AppColors.primaryColor.withOpacity(0.20),
    ),
    3: BoxShadow(
      blurRadius: 32,
      offset: Offset(4, 16),
      color: AppColors.primaryColor.withOpacity(0.20),
    ),
  };
}
