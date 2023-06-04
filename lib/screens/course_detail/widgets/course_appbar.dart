import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseAppBar extends StatelessWidget {
  const CourseAppBar({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 0.35.sh,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                course.imageUrl!,
              ),
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightColor.withOpacity(0.6),
              ),
              child: Icon(
                MyIcons.solidPlayCircle,
                color: AppColors.primaryColor,
                size: 40.w,
              ),
            ),
          ),
        ),
        Positioned(
          left: 24.w,
          right: 24.w,
          top: 40.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 36.w,
                width: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightColor.withOpacity(0.6),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    MyIcons.solidArrowLeftSmall,
                    color: AppColors.greyScaleColor[900],
                  ),
                ),
              ),
              Container(
                height: 36.w,
                width: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightColor.withOpacity(0.6),
                ),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    MyIcons.bookmark,
                    color: AppColors.greyScaleColor[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
