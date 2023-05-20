import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/screens/course_detail/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late CourseModel course;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    course = Data.getCourseList().firstWhere(
      (element) => element.id == ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CourseAppBar(
              course: course,
            ),
            Column(
              children: [
                CourseInfo(
                  course: course,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Divider(),
                ),
                CourseTabbar(
                  tabController: tabController,
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: AppElevatedButton.primary(
          //onPressed: () {},
          child: Text(
            'Enroll Course - \$40',
            style:
                AppTextStyle.bodyLarge(FontWeight.bold, AppColors.lightColor),
          ),
          radius: 100,
        ),
      ),
    );
  }
}
