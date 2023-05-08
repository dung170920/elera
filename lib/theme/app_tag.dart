import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTag on Widget {
  static Widget solid({
    required StatusColor status,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: radiusCircular(6),
      ),
      child: Text(
        text,
        style: AppTextStyle.bodyXSmall(
          FontWeight.w600,
          AppColors.lightColor,
        ),
      ),
    );
  }

  static Widget outlined({
    required StatusColor status,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: radiusCircular(6),
      ),
      child: Text(
        text,
        style: AppTextStyle.bodyXSmall(
          FontWeight.w600,
          status.color,
        ),
      ),
    );
  }

  static Widget inverted({
    required StatusColor status,
    required String text,
    // ThemeMode mode = ThemeMode.light,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 10.w),
      decoration: BoxDecoration(
        color: status.color.withOpacity(0.08),
        borderRadius: radiusCircular(6),
      ),
      child: Text(
        text,
        style: AppTextStyle.bodyXSmall(
          FontWeight.w600,
          status.color,
        ),
      ),
    );
  }
}
