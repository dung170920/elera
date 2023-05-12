import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: AppBar(
        leadingWidth: 28,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            MyIcons.arrowLeftSmall,
            size: 28.w,
          ),
        ),
        title: Text(
          'Notification',
          style: AppTextStyle.h4(),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              MyIcons.checkDouble,
              size: 28.w,
            ),
          ),
        ],
      ),
    );
  }
}
