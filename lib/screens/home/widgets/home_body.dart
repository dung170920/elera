import 'package:elera/screens/home/widgets/widgets.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: HomeAppBar(),
        preferredSize: Size.fromHeight(100.w),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      prefix: Icon(MyIcons.search),
                      hintText: 'Search',
                      sufix: GestureDetector(
                        child: Icon(
                          MyIcons.solidSlidersHorizontalAlt,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: HomeSlider(),
          ),
          SliverToBoxAdapter(
            child: TopMentor(),
          ),
          SliverToBoxAdapter(
            child: PopuplarCourses(),
          ),
        ],
      ),
    );
  }
}
