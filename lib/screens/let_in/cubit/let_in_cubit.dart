import 'package:bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'let_in_state.dart';

class LetInCubit extends Cubit<LetInState> {
  final AuthService _authService;

  LetInCubit(this._authService) : super(LetInState.inital());

  void signInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authService.logInWithGoogle();

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
    }
  }
}
