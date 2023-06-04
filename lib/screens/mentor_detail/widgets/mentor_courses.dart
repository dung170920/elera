import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorCourses extends StatelessWidget {
  const MentorCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.w),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    CourseCard(course: CourseModel.empty),
                itemCount: 0,
                separatorBuilder: (context, index) => SizedBox(height: 16.w),
              ),
            )
          ],
        ),
      ),
    );
  }
}
