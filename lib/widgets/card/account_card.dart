import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.action});

  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          child: Image.asset(
            logo,
            height: 60.w,
            width: 60.w,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nguyen Thi Hoang Dung',
                style: AppTextStyle.h6(),
              ),
              SizedBox(
                height: 4.w,
              ),
              Text(
                'React, Flutter Mentor',
                style: AppTextStyle.bodyMedium(
                    FontWeight.w500, AppColors.greyScaleColor[700]),
              ),
            ],
          ),
        ),
        action,
      ],
    );
  }
}
