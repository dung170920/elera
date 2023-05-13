import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthService _authService;

  SignInCubit(this._authService) : super(SignInState.inital());

  void onEmailChanged(String email) => emit(
        state.copyWith(
          email: EmailInput.pure(email),
          status: FormzSubmissionStatus.initial,
        ),
      );

  void onPasswordChanged(String password) => emit(
        state.copyWith(
          password: PasswordInput.pure(password),
          status: FormzSubmissionStatus.initial,
        ),
      );

  void signInSubmitted() async {
    if (state.status == FormzSubmissionStatus.inProgress) return;

    final email = EmailInput.dirty(state.email.value);
    final password = PasswordInput.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
      ),
    );

    if (Formz.validate([email, password])) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      try {
        await _authService.signInWithEmailAndPassword(
            email: email.value, password: password.value);

        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } on AppExceptions catch (e) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: e.message,
        ));
      } catch (_) {
        emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
        ));
      }
    }
  }
}
