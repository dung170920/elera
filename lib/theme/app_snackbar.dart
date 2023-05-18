import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ShowSnackBarBuildContextExtension on BuildContext {
  void showSnackBar(
    StatusType status,
    String message, [
    Duration duration = const Duration(seconds: 1),
  ]) {
    final messengerState = ScaffoldMessenger.of(this);
    messengerState.hideCurrentSnackBar();
    messengerState.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        dismissDirection: DismissDirection.startToEnd,
        showCloseIcon: false,
        elevation: 0,
        content: Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(bottom: 0.75.sh),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.w),
          decoration: BoxDecoration(
            color: AppColors.lightColor,
            borderRadius: radiusCircular(),
            boxShadow: AppStyles.snackbarShadow,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: status.color.withOpacity(0.2),
                      ),
                      child: Icon(
                        status.icon,
                        color: status.color,
                        size: 20.w,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          message,
                          softWrap: true,
                          style: AppTextStyle.bodyXLarge(
                            FontWeight.bold,
                            AppColors.greyScaleColor[900],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              GestureDetector(
                onTap: () => messengerState.hideCurrentSnackBar(),
                child: Icon(
                  MyIcons.times,
                  color: AppColors.greyScaleColor[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void hideCurrentSnackBar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}
