import 'package:elera/routes/routes.dart';
import 'package:elera/screens/let_in/cubit/let_in_cubit.dart';
import 'package:elera/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:elera/screens/sign_in/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(
        isBack: true,
        title: '',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 20.w),
            child: Column(
              children: [
                Text(
                  'Login to your Account',
                  style: AppTextStyle.h1(),
                ),
                SizedBox(
                  height: 36.w,
                ),
                SignInForm(),
                SizedBox(
                  height: 36.w,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or continue with',
                        style: AppTextStyle.bodyXLarge(
                          FontWeight.w600,
                          AppColors.greyScaleColor[700],
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: 20.w,
                ),
                Wrap(
                  spacing: 20.w,
                  direction: Axis.horizontal,
                  children: Data.getThirdSignInList()
                      .map(
                        (e) => Expanded(
                          child: AppOutlinedButton.primary(
                            // width: 88.w,
                            child: Image.asset(
                              e.img!,
                              height: 24.w,
                              width: 24.w,
                            ),
                            onPressed: () {
                              switch (e.img) {
                                case google:
                                  context.read<LetInCubit>().signInWithGoogle();
                                  break;
                                default:
                              }
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 36.w,
                ),
                TextWithLink(
                  text: 'Don’t have an account?',
                  linkText: 'Sign up',
                  linkAction: () => Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.SIGN_UP,
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
