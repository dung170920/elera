import 'package:elera/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:elera/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  // Future<void> _handleSignIn() async {
  //   try {
  //     final state = context.read<SignInBloc>().state;
  //     String email = state.email;
  //     String password = state.password;
  //     final auth = FirebaseAuth.instance;

  //     final credential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);

  //     if (credential.user == null) {
  //       return;
  //     }

  //     if (!credential.user!.emailVerified) {
  //       credential.user!.sendEmailVerification();
  //       AppSnackbar.show(context: context, title: 'verify');
  //       return;
  //     }

  //     AppSnackbar.show(context: context, title: 'Login successfully');
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       AppSnackbar.show(
  //           context: context, title: 'No user found with this email');
  //       return;
  //     }
  //     if (e.code == 'wrong-password') {
  //       AppSnackbar.show(context: context, title: 'Password is wrong');
  //       return;
  //     }
  //     if (e.code == 'invalid-email') {
  //       AppSnackbar.show(context: context, title: 'Email format is wrong');
  //       return;
  //     }
  //     if (e.code == 'too-many-requests') {
  //       AppSnackbar.show(
  //           context: context,
  //           title: 'Account block because password is wrong many time');
  //       return;
  //     }
  //     print(e.code);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          AppSnackbar.show(
            context: context,
            title: 'error',
          );
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Form(
            child: Column(
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
                    context.read<SignInBloc>().add(EmailEvent(value));
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
                    context.read<SignInBloc>().add(PasswordEvent(value));
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
                      : () => context
                          .read<SignInBloc>()
                          .add(SignInWithEmailAndPasswordEvent()),
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
            ),
          );
        },
      ),
    );
  }
}
