import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppElevatedButton on ElevatedButton {
  static ElevatedButton primary({
    Color? color,
    VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.large,
    double? radius,
    bool isLoading = false,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        disabledBackgroundColor: StatusType.DISABLED_BUTTON.color,
        padding: size == ButtonSize.small
            ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w)
            : size == ButtonSize.medium
                ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w)
                : EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
        shape: RoundedRectangleBorder(
          borderRadius: radiusCircular(radius),
        ),
        elevation: 0,
        maximumSize: Size.fromHeight(58.h),
        //minimumSize: Size.fromHeight(48.h),
      ),
      onPressed: onPressed,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : child,
    );
  }

  static ElevatedButton secondary({
    Color? color,
    VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.large,
    double? radius,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: color != null
            ? color.withOpacity(0.1)
            : AppColors.primaryColor.withOpacity(0.1),
        foregroundColor: color ?? AppColors.primaryColor,
        disabledBackgroundColor:
            StatusType.DISABLED_BUTTON.color.withOpacity(0.1),
        elevation: 0,
        padding: size == ButtonSize.small
            ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w)
            : size == ButtonSize.medium
                ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w)
                : EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
        textStyle: AppTextStyle.bodyLarge(FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: radiusCircular(radius),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

extension AppOutlinedButton on OutlinedButton {
  static OutlinedButton primary(
      {VoidCallback? onPressed,
      ButtonSize size = ButtonSize.large,
      required Widget child,
      Color? color,
      double? radius}) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: color,
        side: color != null ? BorderSide(color: color) : null,
        padding: size == ButtonSize.small
            ? EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.w)
            : size == ButtonSize.medium
                ? EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.w)
                : EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.w),
        shape: RoundedRectangleBorder(
          borderRadius: radiusCircular(radius),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
