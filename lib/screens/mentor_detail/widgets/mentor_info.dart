import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
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
          child: CacheImage(
            image: "",
            height: 120.w,
            width: 120.w,
            borderRadius: 120,
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
