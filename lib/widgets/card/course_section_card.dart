import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseSectionCard extends StatelessWidget {
  const CourseSectionCard({super.key, required this.section});
  final CourseSectionCardModel section;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24.w),
        subtitle: Text(
          '${Duration(seconds: section.sectionDuration ?? 0).inMinutes} min | ${section.totalLesson} lessons',
          style: AppTextStyles.bodyMedium(
            FontWeight.bold,
            AppColors.primaryColor,
          ),
        ),
        title: Text(
          section.title ?? "",
          style: AppTextStyles.bodyLarge(
            FontWeight.bold,
            AppColors.greyScaleColor[700],
          ),
        ),
        childrenPadding: EdgeInsets.only(top: 12.w),
        children: section.lessons
                ?.map(
                  (e) => LessonCard(
                    lesson: e,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
