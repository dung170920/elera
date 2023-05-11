import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSnackbar {
  static void show(
      {required BuildContext context,
      required String title,
      required StatusEnum status}) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      dismissDirection: DismissDirection.startToEnd,
      showCloseIcon: false,
      elevation: 0,
      content: Container(
        width: 1.0.sw,
        margin: EdgeInsets.only(bottom: 0.7.sh, top: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.w),
        decoration: BoxDecoration(
          color: AppColors.lightColor,
          borderRadius: radiusCircular(),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              offset: const Offset(-5, 10),
              blurRadius: 60,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(status.icon, color: status.color),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Text(
                        title,
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
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Icon(
                MyIcons.times,
                color: AppColors.greyScaleColor[900],
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
