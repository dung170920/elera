import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
