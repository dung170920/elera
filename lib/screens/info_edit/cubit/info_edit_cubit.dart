import 'package:bloc/bloc.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'info_edit_state.dart';

class InfoEditCubit extends Cubit<InfoEditState> {
  InfoEditCubit() : super(InfoEditState.inital());

  void onEmailChanged(String email) => emit(
        state.copyWith(
          email: EmailInput.pure(email),
          status: FormzSubmissionStatus.initial,
        ),
      );

  void onNameChanged(String name) => emit(
        state.copyWith(
          name: TextInput.pure(max: 30, min: 1, value: name),
          status: FormzSubmissionStatus.initial,
        ),
      );

  void editSubmitted() async {
    if (state.status == FormzSubmissionStatus.inProgress) return;

    final email = EmailInput.dirty(state.email.value);
    final name = TextInput.dirty(value: state.name.value);
    emit(
      state.copyWith(
        email: email,
        name: name,
      ),
    );

    if (Formz.validate([email, name])) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.inProgress,
        ),
      );
      try {
        print("name $name");
        // await _authService.signInWithEmailAndPassword(
        //     email: email.value, password: password.value);

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
