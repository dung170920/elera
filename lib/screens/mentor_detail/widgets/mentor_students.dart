import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

class MentorStudents extends StatelessWidget {
  const MentorStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.w),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => AccountCard(
          user: UserModel.empty,
          action: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Magicon.commentDots,
                size: 28.w,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
        itemCount: 10,
        separatorBuilder: (context, index) => SizedBox(height: 24.w),
      ),
    );
  }
}
