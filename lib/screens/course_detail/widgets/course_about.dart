import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class CourseAbout extends StatelessWidget {
  const CourseAbout({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mentor',
              style: AppTextStyle.h5(),
            ),
            SizedBox(
              height: 16.w,
            ),
            AccountCard(
              user: course.mentor ?? UserModel.empty,
              action: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: AppElevatedButton.primary(
                  onPressed: () =>
                      Navigator.pushNamed(context, AppRoutes.MENTOR_DETAIL),
                  child: Text(
                    'View',
                    style: AppTextStyle.bodyMedium(
                        FontWeight.w600, AppColors.lightColor),
                  ),
                  size: ButtonSize.small,
                  radius: 100,
                ),
              ),
            ),
            SizedBox(
              height: 24.w,
            ),
            Text(
              'About Course',
              style: AppTextStyle.h5(),
            ),
            SizedBox(
              height: 16.w,
            ),
            ReadMoreText(
              course.description ?? "",
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Read more',
              trimExpandedText: ' Read less',
              style: AppTextStyle.bodyMedium(),
              moreStyle: AppTextStyle.bodyMedium(
                  FontWeight.bold, AppColors.primaryColor),
              lessStyle: AppTextStyle.bodyMedium(
                  FontWeight.bold, AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
