import 'package:elera/routes/routes.dart';
import 'package:elera/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:elera/screens/sign_up/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Icon(
              MyIcons.arrowLeftSmall,
              size: 28.w,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 20.w),
            child: Column(
              children: [
                Text(
                  'Create your Account',
                  style: AppTextStyle.h1(),
                ),
                SizedBox(
                  height: 26.w,
                ),
                SignUpForm(),
                SizedBox(
                  height: 26.w,
                ),
                TextWithLink(
                  text: 'Already have an account?',
                  linkText: 'Sign in',
                  linkAction: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.SIGN_IN,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
