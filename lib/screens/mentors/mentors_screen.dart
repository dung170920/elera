import 'package:elera/constants/constants.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

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
              Magicon.search,
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
                  itemBuilder: (context, index) => AccountCard(
                    action: Padding(
                      padding: EdgeInsets.only(left: 12.w),
                      child: AppElevatedButton.primary(
                        onPressed: () => Navigator.pushNamed(
                            context, AppRoutes.MENTOR_DETAIL),
                        child: Text(
                          'View',
                          style: AppTextStyle.bodyMedium(
                              FontWeight.w600, AppColors.lightColor),
                        ),
                        size: ButtonSize.small,
                        radius: 100,
                      ),
                    ),
                  ),
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
