import 'package:elera/models/course_model.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/courses/cubit/courses_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCourses extends StatelessWidget {
  const PopularCourses({super.key, required this.courses});

  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Most Popular Courses',
                style: AppTextStyles.h6(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.COURSES);
                  context.read<CoursesCubit>().init();
                },
                child: Text(
                  'See All',
                  style: AppTextStyles.bodyLarge(
                      FontWeight.bold, AppColors.primaryColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  CourseCard(course: courses[index]),
              itemCount: courses.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.w),
            ),
          )
        ],
      ),
    );
  }
}
