import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseSection extends StatelessWidget {
  const CourseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24.w),
        subtitle: Text(
          '15 mins | 2 lessons',
          style: AppTextStyle.bodyMedium(
            FontWeight.bold,
            AppColors.primaryColor,
          ),
        ),
        title: Text(
          'Section 1 - Introduction',
          style: AppTextStyle.bodyLarge(
            FontWeight.bold,
            AppColors.greyScaleColor[700],
          ),
        ),
        childrenPadding: EdgeInsets.zero,
        children: [
          LessonCard(),
          LessonCard(),
        ],
      ),
    );
  }
}
