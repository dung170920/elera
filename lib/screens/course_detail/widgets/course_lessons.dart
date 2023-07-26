import 'package:elera/models/models.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CourseLessons extends StatelessWidget {
  const CourseLessons({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: course.sections
                ?.map(
                  (e) => CourseSectionCard(
                    section: e,
                  ),
                )
                .toList() ??
            [
              Center(
                child: Text('No lesson in course'),
              )
            ],
      ),
    );
  }
}
