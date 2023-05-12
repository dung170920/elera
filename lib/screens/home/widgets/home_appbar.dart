import 'package:elera/constants/constants.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(24.w),
          child: AppBar(
            leadingWidth: 48.w,
            leading: CircleAvatar(
              child: state.user.avatar != null
                  ? Image.network(
                      state.user.avatar!,
                    )
                  : Image.asset(logo),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: AppTextStyle.bodyLarge(
                      null, AppColors.greyScaleColor[600]),
                ),
                Text(
                  context.read<SplashCubit>().state.user.name ?? '',
                  style: AppTextStyle.h5(),
                ),
              ],
            ),
            actions: [
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.NOTIFICATION),
                child: Icon(
                  MyIcons.bell,
                  size: 28.w,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
