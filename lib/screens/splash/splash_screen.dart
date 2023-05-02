import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/home/home_screen.dart';
import 'package:elera/screens/splash/bloc/splash_bloc.dart';
import 'package:elera/services/auth_service.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          if (state.status == AuthStatus.authenticated)
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.HOME, (route) => false);

          if (state.status == AuthStatus.unAuthenticated)
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.LET_IN, (route) => false);
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.asset(logo,
                        fit: BoxFit.contain, height: 150.w, width: 150.w)),
                SizedBox(height: 16.w),
                CircularProgressIndicator(),
                SizedBox(height: 48.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
