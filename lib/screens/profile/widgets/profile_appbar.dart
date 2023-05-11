import 'package:elera/constants/constants.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: AppBar(
        leadingWidth: 32.w,
        leading: Image.asset(
          logo,
          fit: BoxFit.contain,
        ),
        title: Text(
          'Profile',
          style: AppTextStyle.h4(),
        ),
        actions: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AppDialog(
                status: StatusEnum.INFO,
                title: 'Are you sure?',
                subTitle: 'Are you sure?',
                primaryButton: AppElevatedButton.primary(
                  child: Text('Logout'),
                  onPressed: () =>
                      context.read<SplashCubit>().onAuthLogoutRequested(),
                ),
                secondaryButton: AppElevatedButton.secondary(
                  child: Text('Logout'),
                  onPressed: () =>
                      context.read<SplashCubit>().onAuthLogoutRequested(),
                ),
              ),
            ),
            child: Icon(
              MyIcons.solidLogOut,
              size: 28.w,
              color: StatusEnum.ERROR.color,
            ),
          ),
        ],
      ),
    );
  }
}
