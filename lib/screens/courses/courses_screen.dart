import 'package:elera/constants/constants.dart';
import 'package:elera/screens/courses/cubit/courses_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
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
              child: state.status == ListStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Chips(
                            list: [
                              Text('All'),
                            ],
                            selected: 0,
                          ),
                          state.list.isNotEmpty
                              ? Padding(
                                  padding: EdgeInsets.only(bottom: 16.w),
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => CourseCard(
                                        course: state.list.data[index]),
                                    itemCount: state.list.data.length,
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 16.w),
                                  ),
                                )
                              : Center(
                                  child: Text('No data'),
                                )
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
