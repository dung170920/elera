import 'package:elera/screens/home/cubit/home_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: AppColors.lightColor,
        currentIndex: context.read<HomeCubit>().state.index,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        iconSize: 24.w,
        selectedLabelStyle: AppTextStyle.bodyXSmall(FontWeight.bold),
        unselectedLabelStyle: AppTextStyle.bodyXSmall(FontWeight.w500),
        unselectedItemColor: AppColors.greyScaleColor[500],
        selectedItemColor: AppColors.primaryColor,
        onTap: (value) {
          context.read<HomeCubit>().onPageChange(value);
        },
        items: Data.getBottomBarItemList()
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.iconData),
                label: e.title,
                activeIcon: Icon(e.activeIconData),
              ),
            )
            .toList(),
      ),
    );
  }
}
