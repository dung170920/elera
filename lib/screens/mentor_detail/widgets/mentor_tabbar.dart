import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorTabBar extends StatelessWidget {
  const MentorTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.greyScaleColor[200]!,
            width: 2.w,
          ),
        ),
      ),
      child: TabBar(
        controller: tabController,
        indicatorWeight: 4.w,
        indicatorColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
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
            text: 'Courses',
          ),
          Tab(
            text: 'Students',
          ),
          Tab(
            text: 'Reviews',
          ),
        ],
      ),
    );
  }
}
