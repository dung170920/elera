import 'package:elera/screens/home/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: HomeAppBar(),
        preferredSize: Size.fromHeight(90.w),
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
                      focus: _focusNode,
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
            child: PopularCourses(),
          ),
        ],
      ),
    );
  }
}
