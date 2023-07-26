import 'package:elera/constants/constants.dart';
import 'package:elera/screens/course_detail/cubit/course_detail_cubit.dart';
import 'package:elera/screens/course_detail/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var scrollController = ScrollController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    context.read<CourseDetailCubit>().getCourse(args['id']);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CourseDetailCubit, CourseDetailState>(
        builder: (context, state) {
          if (state.status == LoadStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return state.status == LoadStatus.success
              ? Scaffold(
                  body: DefaultTabController(
                    length: 3,
                    child: NestedScrollView(
                      controller: scrollController,
                      headerSliverBuilder: (context, innerBoxIsScrolled) => [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              CourseAppBar(course: state.course),
                              CourseInfo(course: state.course),
                              CourseTabbar(tabController: tabController),
                            ],
                          ),
                        ),
                      ],
                      body: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          CourseAbout(
                            course: state.course,
                          ),
                          CourseLessons(
                            course: state.course,
                          ),
                          CourseReview()
                        ],
                      ),
                    ),
                  ),
                  bottomNavigationBar: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: AppElevatedButton.primary(
                      onPressed: () {},
                      child: Text(
                        'Enroll Course - \$${state.course.price}',
                        style: AppTextStyles.bodyLarge(
                            FontWeight.bold, AppColors.lightColor),
                      ),
                      radius: 100,
                    ),
                  ),
                )
              : Center(
                  child: Text(state.errorMessage!),
                );
        },
      ),
    );
  }
}
