import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      margin: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            sliderDecor,
          ),
          fit: BoxFit.cover,
        ),
        color: AppColors.primaryColor,
        borderRadius: radiusCircular(AppStyles.DEFAULT_LARGE_RADIUS),
        boxShadow: AppStyles.buttonShadow[1]!,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '40% OFF',
                      style: AppTextStyle.bodyMedium(
                          FontWeight.w600, AppColors.lightColor),
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Text(
                      'Today’s Special',
                      style: AppTextStyle.h5(AppColors.lightColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                '40%',
                style: AppTextStyle.h1(AppColors.lightColor),
              ),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          Text(
            'Get a discount for every course order! Only valid for today!',
            style: AppTextStyle.bodyLarge(
              FontWeight.w500,
              AppColors.lightColor,
            ),
          ),
          SizedBox(
            height: 16.w,
          ),
          Center(
            child: Wrap(
              spacing: 5.w,
              children: [
                Container(
                  height: 4.w,
                  width: 16.w,
                  decoration: BoxDecoration(
                    borderRadius: radiusCircular(100),
                    color: AppColors.lightColor,
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    borderRadius: radiusCircular(100),
                    color: AppColors.greyScaleColor[300],
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    borderRadius: radiusCircular(100),
                    color: AppColors.greyScaleColor[300],
                  ),
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                    borderRadius: radiusCircular(100),
                    color: AppColors.greyScaleColor[300],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
        ],
      ),
    );
  }
}
