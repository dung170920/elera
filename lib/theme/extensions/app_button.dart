import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppElevatedButton on ElevatedButton {
  static ElevatedButton primary({
    Color? color,
    VoidCallback? onPressed,
    required Widget child,
    double? width,
    double? radius,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(width ?? double.maxFinite),
        backgroundColor: color ?? AppColors.primaryColor,
        disabledBackgroundColor:
            AppColors.statusColor[StatusEnum.DISABLED_BUTTON],
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
        shape: RoundedRectangleBorder(
          borderRadius: radiusCircular(radius),
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: child,
    );
  }

  static ElevatedButton secondary(
      {Color? color,
      VoidCallback? onPressed,
      required Widget child,
      double? width,
      double? radius}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color != null
            ? color.withOpacity(0.1)
            : AppColors.primaryColor.withOpacity(0.1),
        disabledBackgroundColor:
            AppColors.statusColor[StatusEnum.DISABLED_BUTTON],
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
        shape: RoundedRectangleBorder(
          borderRadius: radiusCircular(radius),
        ),
        fixedSize: Size.fromWidth(width ?? double.maxFinite),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

extension AppOutlinedButton on OutlinedButton {
  static OutlinedButton primary(
      {VoidCallback? onPressed,
      required Widget child,
      double? width,
      double? radius}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: Size.fromWidth(width ?? double.maxFinite),
          backgroundColor: AppColors.lightColor,
          disabledBackgroundColor: AppColors.greyScaleColor[100]!,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 18.w),
          shape: RoundedRectangleBorder(
            borderRadius: radiusCircular(radius),
            side: BorderSide(
              color: AppColors.greyScaleColor[200]!,
              width: 1,
            ),
          ),
          elevation: 0),
      onPressed: onPressed,
      child: child,
    );
  }
}
