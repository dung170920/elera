import 'package:elera/models/models.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({super.key, required this.lesson});
  final CourseLessonModel lesson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.w, 20.w, 16.w),
      margin: EdgeInsets.only(bottom: 24.w, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        borderRadius: radiusCircular(16),
        boxShadow: AppStyles.cardShadow[2],
        color: context.read<ProfileCubit>().state.theme == AppTheme.lightTheme
            ? AppColors.lightColor
            : AppColors.darkColor[2],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Container(
              //   height: 44.w,
              //   width: 44.w,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: AppColors.primaryColor.withOpacity(0.08),
              //   ),
              //   child: Center(
              //     child: Text(
              //       lesson.,
              //       style: AppTextStyle.h6(AppColors.primaryColor),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   width: 16.w,
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title ?? "",
                    style: AppTextStyle.h6(),
                  ),
                  SizedBox(
                    height: 6.w,
                  ),
                  Text(
                    '${Duration(seconds: lesson.duration ?? 0).inMinutes} min',
                    style: AppTextStyle.bodyMedium(
                        FontWeight.w500, AppColors.greyScaleColor[700]),
                  ),
                ],
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Magicon.solidPlayCircle,
              color: AppColors.primaryColor,
              size: 28.w,
            ),
          )
        ],
      ),
    );
  }
}
