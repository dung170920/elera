import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: 20.w,
        children: [
          Text(
            course.title ?? "",
            style: AppTextStyle.h4(),
          ),
          Row(
            children: [
              AppTag.inverted(status: StatusType.INFO, text: course.type!.name),
              SizedBox(
                width: 16.w,
              ),
              Icon(
                Magicon.solidStarHalf,
                size: 20,
                color: StatusType.WARNING.color,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                course.rating!.toString(),
                style: AppTextStyle.bodyLarge(
                  FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                '|',
                style: AppTextStyle.bodyLarge(
                  FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                course.reviewsCount != null
                    ? '${formatCurrency(price: double.parse(course.reviewsCount.toString()))} reviews'
                    : "0 review",
                style: AppTextStyle.bodyLarge(
                  FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text(
            formatCurrency(price: course.price!, symbol: '\$'),
            style: AppTextStyle.h3(AppColors.primaryColor),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Magicon.solidUsersGroup,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    course.studentsCount == 0
                        ? '0 student'
                        : '${formatCurrency(price: double.parse(course.studentsCount!.toString()))} students',
                    style: AppTextStyle.bodyLarge(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Magicon.solidClock,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    course.courseDuration == 0
                        ? "0 hour"
                        : '${Duration(seconds: course.courseDuration!).inHours} hours',
                    style: AppTextStyle.bodyLarge(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Magicon.solidNoteText,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    // course. == 0
                    //     ? "0 lesson"
                    //     : '${course.courseDuration} hours',
                    '124 lessons',
                    style: AppTextStyle.bodyLarge(
                      FontWeight.w500,
                      AppColors.greyScaleColor[800],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
