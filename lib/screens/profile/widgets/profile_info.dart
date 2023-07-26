import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/common.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: CacheImage(
                  borderRadius: 60,
                  height: 60.w,
                  width: 60.w,
                  image: user.avatar ?? "",
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
                    Magicon.solidCamera,
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
            style: AppTextStyles.h4(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.w,
          ),
          Text(
            user.email ?? '',
            style: AppTextStyles.bodyMedium(FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
