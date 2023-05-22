import 'package:elera/widgets/course_section.dart';
import 'package:flutter/material.dart';

class CourseLessons extends StatelessWidget {
  const CourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CourseSection(),
          CourseSection(),
          CourseSection(),
        ],
      ),
    );
  }
}
