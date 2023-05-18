import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
              child: CircleAvatar(
                radius: 60.w,
                backgroundImage: user.avatar != null
                    ? NetworkImage(
                        user.avatar!,
                      )
                    : AssetImage(logo) as ImageProvider,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: radiusCircular(6)),
                child: Icon(
                  MyIcons.solidCamera,
                  color: AppColors.lightColor,
                  size: 24,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 12.w,
        ),
        Text(
          user.name ?? '',
          style: AppTextStyle.h4(),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          user.email ?? '',
          style: AppTextStyle.bodyMedium(FontWeight.w600),
        ),
      ],
    );
  }
}
