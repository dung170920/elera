import 'package:bloc/bloc.dart';
import 'package:elera/screens/sign_up/bloc/bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<FullNameEvent>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RePasswordEvent>((event, emit) {
      emit(state.copyWith(rePassword: event.rePassword));
    });
  }
}
