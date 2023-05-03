import 'package:bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthService authService;
  SignInBloc(this.authService) : super(SignInState.inital()) {
    on<EmailEvent>((event, emit) {
      //final email = Email.dirty(event.email);
      emit(
        state.copyWith(
          email: Email.pure(event.email),
        ),
      );
    });

    on<PasswordEvent>((event, emit) {
      emit(
        state.copyWith(
          password: Password.pure(event.password),
        ),
      );
    });

    on<SignInWithEmailAndPasswordEvent>((event, emit) async {
      if (state.status == FormzSubmissionStatus.inProgress) return;

      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
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
          await authService.signInWithEmailAndPassword(
              email: state.password.value, password: state.password.value);

          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } catch (e) {
          print(e.toString());
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      }
    });
  }
}
