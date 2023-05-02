import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithLink extends StatelessWidget {
  const TextWithLink(
      {super.key,
      required this.text,
      required this.linkText,
      required this.linkAction});

  final String text;
  final String linkText;
  final VoidCallback linkAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyle.bodyMedium(null, AppColors.greyScaleColor[500]),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: linkAction,
          child: Text(
            linkText,
            style: AppTextStyle.bodyMedium(
                FontWeight.w600, AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
