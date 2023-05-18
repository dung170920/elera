import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorsScreen extends StatelessWidget {
  const MentorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        title: 'Mentors',
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 16.w),
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => AccountCard(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(height: 24.w),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
