import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'Courses',
        isBack: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              MyIcons.search,
              size: 28.w,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chips(
                  list: [
                    Text('All'),
                  ],
                  selected: 0,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.w),
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CourseCard(course: Data.getCourseList()[index]),
                    itemCount: Data.getCourseList().length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.w),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
