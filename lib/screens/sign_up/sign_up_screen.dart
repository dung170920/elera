import 'package:elera/routes/routes.dart';
import 'package:elera/screens/sign_up/bloc/bloc.dart';
import 'package:elera/screens/sign_up/widgets/widgets.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
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
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Create your Account',
                      style: AppTextStyle.h1,
                    ),
                    SizedBox(
                      height: 36.w,
                    ),
                    SignUpForm(),
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
                      children: getThirdSignInList()
                          .map(
                            (e) => AppOutlinedButton.primary(
                              width: 88.w,
                              child: Image.asset(
                                e.img!,
                                height: 24.w,
                                width: 24.w,
                              ),
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: 36.w,
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
