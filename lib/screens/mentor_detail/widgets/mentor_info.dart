import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MentorInfo extends StatelessWidget {
  const MentorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 120.w,
            width: 120.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 12.w,
        ),
        Text(
          'Jonathan Williams',
          style: AppTextStyles.h4(),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          'UX/UI Design Mentor',
          style: AppTextStyles.bodyMedium(
              FontWeight.w600, AppColors.greyScaleColor[800]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
