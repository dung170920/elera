import 'package:bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'let_in_state.dart';

class LetInCubit extends Cubit<LetInState> {
  final AuthService _authService;

  LetInCubit(this._authService) : super(LetInState.inital());

  // Future<void> signInWithGoogle() async {
  //   emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
  //   try {
  //     await _authService.logInWithGoogle();
  //     await _userService.register();

  //     emit(state.copyWith(status: FormzSubmissionStatus.success));
  //   } on AppExceptions catch (e) {
  //     emit(
  //       state.copyWith(
  //         errorMessage: e.message,
  //         status: FormzSubmissionStatus.failure,
  //       ),
  //     );
  //   } catch (_) {
  //     emit(state.copyWith(
  //       status: FormzSubmissionStatus.failure,
  //     ));
  //   }
  // }
}
