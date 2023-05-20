import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class CourseAbout extends StatelessWidget {
  const CourseAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mentor',
            style: AppTextStyle.h5(),
          ),
          SizedBox(
            height: 16.w,
          ),
          AccountCard(),
          SizedBox(
            height: 24.w,
          ),
          Text(
            'About Course',
            style: AppTextStyle.h5(),
          ),
          SizedBox(
            height: 16.w,
          ),
          ReadMoreText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Read more',
            trimExpandedText: ' Read less',
            style: AppTextStyle.bodyMedium(),
            moreStyle: AppTextStyle.bodyMedium(
                FontWeight.bold, AppColors.primaryColor),
            lessStyle: AppTextStyle.bodyMedium(
                FontWeight.bold, AppColors.primaryColor),
          ),
          SizedBox(
            height: 24.w,
          ),
          Text(
            'Tools',
            style: AppTextStyle.h5(),
          ),
          SizedBox(
            height: 20.w,
          ),
          Wrap(
            spacing: 24.w,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    Image.asset(
                      figma,
                      height: 24.w,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Figma',
                      style: AppTextStyle.bodyXLarge(FontWeight.w600),
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    Image.asset(
                      figma,
                      height: 24.w,
                      width: 24.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'Figma',
                      style: AppTextStyle.bodyXLarge(FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
