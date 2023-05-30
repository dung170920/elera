import 'package:bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'let_in_state.dart';

class LetInCubit extends Cubit<LetInState> {
  final AuthService _authService;
  final UserService _userService;

  LetInCubit(this._authService, this._userService) : super(LetInState.inital());

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authService
          .logInWithGoogle()
          .then((value) async => await _userService.register());

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on AppExceptions catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.failure,
      ));
    }
  }
}
