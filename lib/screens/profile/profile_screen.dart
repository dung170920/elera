import 'package:elera/constants/constants.dart';
import 'package:elera/screens/profile/widgets/widgets.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                title: 'Are you sure?',
                subTitle: 'Are you sure?',
                primaryButton: AppElevatedButton.primary(
                  child: Text('Logout'),
                  onPressed: () =>
                      context.read<SplashCubit>().onAuthLogoutRequested(),
                ),
                secondaryButton: AppElevatedButton.secondary(
                  child: Text('Cancel'),
                  onPressed: () =>
                      Navigator.of(context, rootNavigator: true).pop(),
                ),
              ),
            ),
            child: Icon(
              MyIcons.solidLogOut,
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
