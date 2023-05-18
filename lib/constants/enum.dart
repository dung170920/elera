import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';

enum AuthStatus { authenticated, unAuthenticated }

enum StatusType {
  SUCCESS(const Color(0xFF4ADE80), MyIcons.solidCheckSquare),
  ERROR(const Color(0xFFF75555), MyIcons.solidTimesSquare),
  WARNING(const Color(0xFFFACC15), MyIcons.solidExclamationSquare),
  INFO(const Color(0xFF246BFD), MyIcons.solidQuestionSquare),
  DEFAULT(const Color(0xFF757575)),
  DISABLED(const Color(0xFFD8D8D8)),
  DISABLED_BUTTON(const Color(0xFF4360C9));

  final Color color;
  final IconData? icon;

  const StatusType(this.color, [this.icon]);
}

enum NotificationType {
  PAYMENT_SUCCESS(const Color(0xFF4ADE80), MyIcons.solidWallet),
  CARD_CONNECTED(const Color(0xFF246BFD), MyIcons.solidCreditCard);

  final Color color;
  final IconData icon;

  const NotificationType(this.color, this.icon);
}

enum ListStatus { loading, success, failure }

enum ThemeModes { light, dark }

enum ButtonSize { small, large }
