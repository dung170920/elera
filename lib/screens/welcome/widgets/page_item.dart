import 'package:elera/models/models.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageItem extends StatelessWidget {
  const PageItem(
      {super.key,
      required this.item,
      required this.index,
      required this.total,
      required this.onTap});

  final TextModel item;
  final int index;
  final int total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 320.w,
            height: 320.w,
            child: Image.asset(item.img!),
          ),
          Center(
            child: Container(
              child: Text(
                item.title!,
                textAlign: TextAlign.center,
                style: AppTextStyles.h2(),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  total,
                  (i) => i == index
                      ? Container(
                          width: 32.w,
                          height: 8.w,
                          margin: EdgeInsets.only(right: 6.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.primaryColor,
                          ),
                        )
                      : Container(
                          width: 8.w,
                          height: 8.w,
                          margin: EdgeInsets.only(right: 6.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.greyScaleColor[300],
                          ),
                        ),
                ),
              ],
            ),
          ),
          AppElevatedButton.primary(
            color: AppColors.primaryColor,
            radius: 100,
            onPressed: onTap,
            child: Center(
              child: Text(
                total == index + 1 ? 'Get Started' : 'Next',
                style: AppTextStyles.bodyLarge(
                    FontWeight.bold, AppColors.lightColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
