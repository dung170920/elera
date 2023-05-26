import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        isBack: false,
        title: 'My Courses',
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
    );
  }
}
