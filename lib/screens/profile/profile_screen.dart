import 'package:elera/screens/profile/widgets/widgets.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
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
      appBar: PreferredSize(
        child: ProfileAppBar(),
        preferredSize: Size.fromHeight(80.w),
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
