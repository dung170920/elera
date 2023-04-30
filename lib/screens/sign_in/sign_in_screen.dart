import 'package:elera/extensions/extensions.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            MyIcons.arrowLeftSmall,
            size: 28.w,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24.w, 24.w, 24.w, 48.w),
            child: Column(
              children: [
                Text(
                  'Login to your Account',
                  style: AppTextStyle.h1,
                ),
                SizedBox(
                  height: 45.w,
                ),
                Form(
                  child: Column(
                    children: [
                      AppTextField(
                        hintText: 'Email',
                        textFieldType: TextInputType.emailAddress,
                        isPassword: false,
                        prefix: Icon(MyIcons.solidEnvelope),
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      AppTextField(
                        hintText: 'Email',
                        textFieldType: TextInputType.emailAddress,
                        isPassword: false,
                        prefix: Icon(MyIcons.solidEnvelope),
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      AppElevatedButton.primary(
                        color: AppColors.primaryColor,
                        radius: 100,
                        onPressed: () {},
                        child: Text(
                          'Sign in',
                          style: AppTextStyle.bodyLarge(
                            FontWeight.bold,
                            AppColors.lightColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.w,
                      ),
                      GestureDetector(
                        child: Text(
                          'Forgot the password?',
                          style: AppTextStyle.bodyLarge(
                              FontWeight.w600, AppColors.primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.w,
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'or continue with',
                        style: AppTextStyle.bodyXLarge(
                            FontWeight.w600, AppColors.greyScaleColor[700]),
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
                          child: Image.asset(e.img!),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 45.w,
                ),
                TextWithLink(
                  text: 'Don’t have an account?',
                  linkText: 'Sign up',
                  linkAction: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
