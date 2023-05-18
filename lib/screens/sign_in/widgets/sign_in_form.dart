import 'package:elera/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _focusNodes = List.generate(2, (index) => FocusNode()).toList();

  @override
  void initState() {
    super.initState();
    _focusNodes
        .forEach((element) => element.addListener(() => setState(() {})));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          context.showSnackBar(
            StatusType.ERROR,
            state.errorMessage ?? 'Login failed',
          );
        }

        if (state.status == FormzSubmissionStatus.success) {
          context.showSnackBar(
            StatusType.SUCCESS,
            'Login successfully',
          );
        }
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                label: 'Email',
                hintText: 'Email',
                textFieldType: TextInputType.emailAddress,
                prefix: Icon(MyIcons.solidEnvelope),
                focus: _focusNodes[0],
                initialValue: state.email.value,
                nextFocus: _focusNodes[1],
                errorText: !state.email.isPure && state.email.error != null
                    ? state.email.error?.text
                    : null,
                onChanged: (value) {
                  context.read<SignInCubit>().onEmailChanged(value);
                },
              ),
              SizedBox(
                height: 20.w,
              ),
              AppTextField(
                label: 'Password',
                hintText: 'Password',
                textFieldType: TextInputType.text,
                isPassword: true,
                prefix: Icon(MyIcons.solidLock),
                focus: _focusNodes[1],
                initialValue: state.password.value,
                errorText:
                    !state.password.isPure && state.password.error != null
                        ? state.password.error?.text
                        : null,
                onChanged: (value) {
                  context.read<SignInCubit>().onPasswordChanged(value);
                },
              ),
              SizedBox(
                height: 20.w,
              ),
              AppElevatedButton.primary(
                color: AppColors.primaryColor,
                radius: 100,
                onPressed: state.status == FormzSubmissionStatus.inProgress
                    ? null
                    : () => context.read<SignInCubit>().signInSubmitted(),
                child: Text(
                  'Sign in',
                  style: AppTextStyle.bodyLarge(
                    FontWeight.bold,
                    AppColors.lightColor,
                  ),
                ),
              ),
              SizedBox(
                height: 16.w,
              ),
              Center(
                child: GestureDetector(
                  child: Text(
                    'Forgot the password?',
                    style: AppTextStyle.bodyLarge(
                      FontWeight.w600,
                      AppColors.primaryColor,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
