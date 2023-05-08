import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopMentor extends StatelessWidget {
  const TopMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Mentors',
                style: AppTextStyle.h5(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: AppTextStyle.bodyLarge(
                      FontWeight.bold, AppColors.primaryColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 16.w,
                children: List.generate(
                  20,
                  (index) => Column(
                    children: [
                      Container(
                        width: 72.w,
                        height: 72.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              logo,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Text(
                        'Jacob',
                        style: AppTextStyle.bodyLarge(FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
