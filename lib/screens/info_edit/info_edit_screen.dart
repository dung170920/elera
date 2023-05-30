import 'package:elera/screens/info_edit/cubit/info_edit_cubit.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

class InfoEditScreen extends StatelessWidget {
  const InfoEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar(isBack: true, title: 'Edit Profile'),
      body: BlocBuilder<InfoEditCubit, InfoEditState>(
        builder: (context, state) {
          final user = context.read<SplashCubit>().state.user;
          // state.copyWith(
          //   email: EmailInput.pure(user.email!),
          //   fullName: TextInput.pure(value: user.name!),
          //   status: FormzSubmissionStatus.initial,
          // );
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    AppTextField(
                      hintText: 'Full name',
                      initialValue: user.fullName!,
                      onChanged: context.read<InfoEditCubit>().onNameChanged,
                      errorText: !state.name.isPure && state.name.error != null
                          ? state.name.error?.text
                          : null,
                    ),
                    SizedBox(
                      height: 24.w,
                    ),
                    AppTextField(
                      hintText: 'Email',
                      initialValue: user.email!,
                      onChanged: context.read<InfoEditCubit>().onEmailChanged,
                      errorText:
                          !state.email.isPure && state.email.error != null
                              ? state.email.error?.text
                              : null,
                    ),
                    SizedBox(
                      height: 64.w,
                    ),
                    AppElevatedButton.primary(
                      color: AppColors.primaryColor,
                      radius: 100,
                      onPressed:
                          state.status == FormzSubmissionStatus.inProgress
                              ? null
                              : context.read<InfoEditCubit>().editSubmitted,
                      child: Text(
                        'Update',
                        style: AppTextStyle.bodyLarge(
                          FontWeight.bold,
                          AppColors.lightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
