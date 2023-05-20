import 'package:elera/screens/course_detail/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseTabbar extends StatelessWidget {
  const CourseTabbar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: TabBar(
            controller: tabController,
            indicatorWeight: 4.w,
            indicatorColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,

            // indicator: BoxDecoration(
            //   borderRadius: radiusCircular(100),
            //   border: Border.fromBorderSide(
            //     BorderSide(color: AppColors.greyScaleColor[500]!, width: 2),
            //   ),
            // ),
            unselectedLabelColor: AppColors.greyScaleColor[500],
            labelColor: AppColors.primaryColor,
            unselectedLabelStyle: AppTextStyle.bodyXLarge(
              FontWeight.w600,
            ),
            labelStyle: AppTextStyle.bodyXLarge(
              FontWeight.w600,
            ),
            tabs: [
              Tab(
                text: 'About',
              ),
              Tab(
                text: 'Lessons',
              ),
              Tab(
                text: 'Reviews',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24.w,
        ),
        SizedBox(
          height: 400.w,
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [CourseAbout(), CourseLessons(), CourseReview()],
          ),
        ),
      ],
    );
  }
}
