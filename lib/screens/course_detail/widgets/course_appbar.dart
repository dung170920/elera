import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

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
                course.imageUrl ?? "",
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
                Magicon.solidPlayCircle,
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
                padding: EdgeInsets.all(0.1.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightColor.withOpacity(0.6),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Magicon.solidArrowLeftSmall,
                      color: AppColors.greyScaleColor[900],
                      size: 24.w,
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: AppColors.lightColor.withOpacity(0.6),
              //   ),
              //   padding: EdgeInsets.all(0.1.w),
              //   child: Center(
              //     child: IconButton(
              //       onPressed: () => Navigator.pop(context),
              //       icon: Icon(
              //         Magicon.bookmark,
              //         color: AppColors.greyScaleColor[900],
              //         size: 28.w,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
