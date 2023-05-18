import 'package:elera/constants/constants.dart';
import 'package:elera/routes/routes.dart';
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
                style: AppTextStyle.h6(),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.MENTORS),
                child: Text(
                  'See All',
                  style: AppTextStyle.bodyLarge(
                      FontWeight.bold, AppColors.primaryColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 16.w,
                children: Data.getMentorList()
                    .map(
                      (e) => Column(
                        children: [
                          Container(
                            width: 70.w,
                            height: 70.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                  e.avatar ?? '',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.w,
                          ),
                          Text(
                            e.name.split(" ").first,
                            style: AppTextStyle.bodyLarge(FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
