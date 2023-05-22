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
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    course = Data.getCourseList().firstWhere(
      (element) => element.id == ModalRoute.of(context)!.settings.arguments,
    );

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          //controller: scrollViewController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: CourseAppBar(
                course: course,
              ),
            ),
            SliverToBoxAdapter(
              child: CourseInfo(
                course: course,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Divider(),
              ),
            ),
            SliverToBoxAdapter(
              child: CourseTabbar(tabController: tabController),
            ),
          ],
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [CourseAbout(), CourseLessons(), CourseReview()],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(24.w),
        child: AppElevatedButton.primary(
          onPressed: () {},
          child: Center(
            child: Text(
              'Enroll Course - \$40',
              style:
                  AppTextStyle.bodyLarge(FontWeight.bold, AppColors.lightColor),
            ),
          ),
          radius: 100,
        ),
      ),
    );
  }
}
