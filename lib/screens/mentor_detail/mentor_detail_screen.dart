import 'package:elera/screens/mentor_detail/widgets/widgets.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorDetailScreen extends StatefulWidget {
  const MentorDetailScreen({super.key});

  @override
  State<MentorDetailScreen> createState() => _MentorDetailScreenState();
}

class _MentorDetailScreenState extends State<MentorDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  // late CourseModel course;

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
    return Scaffold(
      appBar: NavBar(
        isBack: true,
        title: 'Mentor',
      ),
      body: ListView(
        children: [
          MentorInfo(),
          MentorStatistic(),
          MentorButtons(),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Divider(),
          ),
          MentorCourses()
        ],
      ),
    );
  }
}
