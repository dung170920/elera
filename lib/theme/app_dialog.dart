import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.primaryButton,
    this.secondaryButton,
    this.icon,
    required this.status,
    this.isLoading = false,
  });

  final String title;
  final String subTitle;
  final bool isLoading;
  final ElevatedButton? primaryButton;
  final ElevatedButton? secondaryButton;
  final IconData? icon;
  final StatusEnum status;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 0.85.sw,
        padding: EdgeInsets.fromLTRB(32.w, 40.w, 32.w, 32.w),
        decoration: BoxDecoration(
          borderRadius: radiusCircular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100.w,
              width: 100.w,
              decoration: BoxDecoration(
                color: status.color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon ?? status.icon,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            SizedBox(
              height: 32.w,
            ),
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h4(
                    status.color,
                  ),
                ),
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyLarge(),
                ),
              ],
            ),
            SizedBox(
              height: 32.w,
            ),
            isLoading
                ? CircularProgressIndicator()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      primaryButton!,
                      SizedBox(height: 12.w),
                      secondaryButton!,
                    ],
                  )
          ],
        ),
      ),
    );
  }
}