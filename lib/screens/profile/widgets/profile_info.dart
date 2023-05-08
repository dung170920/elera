import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120.w,
          width: 120.w,
          child: user.avatar != null
              ? Image.network(
                  user.avatar!,
                )
              : Image.asset(logo),
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
