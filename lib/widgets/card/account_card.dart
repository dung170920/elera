import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({super.key, required this.action, required this.user});

  final Widget action;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            borderRadius: radiusCircular(100),
            image: DecorationImage(
              image: user.avatar != null
                  ? NetworkImage(
                      user.avatar!,
                    )
                  : AssetImage(
                      logo,
                    ) as ImageProvider,
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name ?? "",
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
