import 'package:flutter/material.dart';
import 'package:magicon/magicon.dart';

enum AuthStatus { authenticated, unAuthenticated }

enum StatusType {
  SUCCESS(const Color(0xFF4ADE80), Magicon.solidCheckSquare),
  ERROR(const Color(0xFFF75555), Magicon.solidTimesSquare),
  WARNING(const Color(0xFFFACC15), Magicon.solidExclamationSquare),
  INFO(const Color(0xFF246BFD), Magicon.solidQuestionSquare),
  DEFAULT(const Color(0xFF757575)),
  DISABLED(const Color(0xFFD8D8D8)),
  DISABLED_BUTTON(const Color(0xFF4360C9));

  final Color color;
  final IconData? icon;

  const StatusType(this.color, [this.icon]);
}

enum NotificationType {
  PAYMENT_SUCCESS(const Color(0xFF4ADE80), Magicon.solidWallet),
  CARD_CONNECTED(const Color(0xFF246BFD), Magicon.solidCreditCard);

  final Color color;
  final IconData icon;

  const NotificationType(this.color, this.icon);
}

enum LoadStatus { loading, success, failure }

enum ThemeModes { light, dark }

enum ButtonSize { small, medium, large }
