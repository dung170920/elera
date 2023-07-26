import 'package:elera/constants/constants.dart';
import 'package:elera/screens/profile/widgets/widgets.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magicon/magicon.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        isBack: false,
        title: 'Profile',
        actions: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AppDialog(
                status: StatusType.INFO,
                title: 'Logout',
                subTitle: 'Are you sure to log out?',
                buttons: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppElevatedButton.primary(
                      radius: 100,
                      child: Center(
                        child: Text(
                          'Yes, Logout',
                          style: AppTextStyles.bodyLarge(
                              FontWeight.bold, AppColors.lightColor),
                        ),
                      ),
                      onPressed: () =>
                          context.read<SplashCubit>().onAuthLogoutRequested(),
                    ),
                    SizedBox(height: 12.w),
                    AppElevatedButton.secondary(
                      radius: 100,
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.bodyLarge(
                              FontWeight.bold, AppColors.primaryColor),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
              ),
            ),
            child: Icon(
              Magicon.solidLogOut,
              size: 28.w,
              color: StatusType.ERROR.color,
            ),
          ),
        ],
      ),
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          return Column(
            children: [
              ProfileInfo(
                user: state.user,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 24.w),
                child: Divider(),
              ),
              ProfileActions(),
            ],
          );
        },
      ),
    );
  }
}
