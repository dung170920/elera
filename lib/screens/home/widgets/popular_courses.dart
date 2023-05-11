import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopuplarCourses extends StatelessWidget {
  const PopuplarCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Popular Courses',
                style: AppTextStyle.h6(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: AppTextStyle.bodyLarge(
                      FontWeight.bold, AppColors.primaryColor),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 24.w),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Wrap(
          //       spacing: 12.w,
          //       runAlignment: WrapAlignment.start,
          //       children: [
          //         Chip(
          //           label: Text('All'),
          //           labelStyle: AppTextStyle.bodyLarge(
          //             FontWeight.w600,
          //             AppColors.primaryColor,
          //           ),
          //           labelPadding: EdgeInsets.zero,
          //           visualDensity: VisualDensity.compact,
          //           elevation: 0,
          //           padding:
          //               EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
          //           backgroundColor: AppColors.lightColor,
          //           shape: StadiumBorder(
          //             side: BorderSide(
          //               color: AppColors.primaryColor,
          //               width: 1,
          //             ),
          //           ),
          //         ),
          //         Chip(
          //           label: Text('3D Design'),
          //           labelStyle: AppTextStyle.bodyLarge(
          //             FontWeight.w600,
          //             AppColors.primaryColor,
          //           ),
          //           labelPadding: EdgeInsets.zero,
          //           visualDensity: VisualDensity.compact,
          //           elevation: 0,
          //           padding:
          //               EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
          //           backgroundColor: AppColors.lightColor,
          //           shape: StadiumBorder(
          //             side: BorderSide(
          //               color: AppColors.primaryColor,
          //               width: 1,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  CourseCard(course: Data.getCourseList()[index]),
              itemCount: Data.getCourseList().length,
              separatorBuilder: (context, index) => SizedBox(height: 16.w),
            ),
          )
        ],
      ),
    );
  }
}
