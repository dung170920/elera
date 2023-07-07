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
            course.title!,
            style: AppTextStyle.h3(),
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
              // Text(
              //   course.rate!.toString(),
              //   style: AppTextStyle.bodyLarge(
              //     FontWeight.w500,
              //   ),
              // ),
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
              // Text(
              //   '${formatCurrency(price: double.parse(course.numberVote!.toString()))} reviews',
              //   style: AppTextStyle.bodyLarge(
              //     FontWeight.w500,
              //   ),
              //   overflow: TextOverflow.ellipsis,
              // ),
            ],
          ),
          Text(
            formatCurrency(price: course.price!, symbol: '\$'),
            style: AppTextStyle.h3(AppColors.primaryColor),
          ),
          // course.salePrice != null
          //     ? Row(
          //         children: [
          //           Text(
          //             formatCurrency(price: course.salePrice!, symbol: '\$'),
          //             style: AppTextStyle.h3(AppColors.primaryColor),
          //           ),
          //           SizedBox(
          //             width: 12.w,
          //           ),
          //           Text(
          //             formatCurrency(price: course.price!, symbol: '\$'),
          //             style: AppTextStyle.h5(
          //               AppColors.greyScaleColor[500],
          //             ).copyWith(decoration: TextDecoration.lineThrough),
          //           ),
          //         ],
          //       )
          //     : Text(
          //         formatCurrency(price: course.price!, symbol: '\$'),
          //         style: AppTextStyle.h3(AppColors.primaryColor),
          //       ),
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
                  // Text(
                  //   '${formatCurrency(price: double.parse(course.numberVote!.toString()))} students',
                  //   style: AppTextStyle.bodyLarge(
                  //     FontWeight.w500,
                  //     AppColors.greyScaleColor[800],
                  //   ),
                  // )
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
                  // Text(
                  //   '${course.totalDuration ?? 0} hours',
                  //   style: AppTextStyle.bodyLarge(
                  //     FontWeight.w500,
                  //     AppColors.greyScaleColor[800],
                  //   ),
                  // )
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
                    '124 lesssons',
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
