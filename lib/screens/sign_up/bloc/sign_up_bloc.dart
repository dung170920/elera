import 'package:bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:equatable/equatable.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService authService;
  SignUpBloc(this.authService) : super(SignUpState.inital()) {
    on<NameEvent>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignUpWithEmailAndPasswordEvent>((event, emit) async {
      if (state.status == SignUpStatus.submitting) return;

      emit(state.copyWith(status: SignUpStatus.submitting));

      try {
        await authService.signUp(
            email: state.email, password: state.password, name: state.name);

        emit(state.copyWith(status: SignUpStatus.sucess));
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: SignUpStatus.error));
      }
    });
  }
}
