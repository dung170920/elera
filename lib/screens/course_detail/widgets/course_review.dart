import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseReview extends StatelessWidget {
  const CourseReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chips(
            list: [
              Row(
                children: [
                  Icon(
                    MyIcons.solidStar,
                    size: 16.w,
                    color: AppColors.lightColor,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text('All'),
                ],
              ),
              ...List.generate(
                5,
                (index) => Row(
                  children: [
                    Icon(
                      MyIcons.solidStar,
                      size: 16.w,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text('${index + 1}'),
                  ],
                ),
              ).reversed
            ],
            selected: 0,
          ),
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => CommentCard(),
            itemCount: 2,
            separatorBuilder: (context, index) => SizedBox(height: 24.w),
          )
        ],
      ),
    );
  }
}
