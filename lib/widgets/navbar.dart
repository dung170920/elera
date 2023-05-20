import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget with PreferredSizeWidget {
  const NavBar(
      {super.key,
      required this.isBack,
      required this.title,
      this.actions,
      this.onTapBack});

  final bool isBack;
  final VoidCallback? onTapBack;
  final String title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(80.w);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: AppBar(
        leadingWidth: 32.w,
        leading: isBack
            ? GestureDetector(
                onTap: onTapBack ?? () => Navigator.pop(context),
                child: Icon(
                  MyIcons.solidArrowLeftSmall,
                  size: 28.w,
                ),
              )
            : Image.asset(
                logo,
                fit: BoxFit.contain,
              ),
        title: Text(
          title,
          style: AppTextStyle.h4(),
        ),
        actions: actions,
      ),
    );
  }
}
