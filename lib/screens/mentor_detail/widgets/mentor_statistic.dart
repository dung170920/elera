import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorStatistic extends StatelessWidget {
  const MentorStatistic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    '25',
                    style: AppTextStyle.h4(),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    'Courses',
                    style: AppTextStyle.bodyMedium(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: VerticalDivider(
                color: AppColors.greyScaleColor[200],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '22,379',
                    style: AppTextStyle.h4(),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    'Students',
                    style: AppTextStyle.bodyMedium(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: VerticalDivider(
                color: AppColors.greyScaleColor[200],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '9,287',
                    style: AppTextStyle.h4(),
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    'Reviews',
                    style: AppTextStyle.bodyMedium(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
