part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const SignInState({
    required this.email,
    required this.password,
    required this.status,
    this.errorMessage,
  });

  factory SignInState.inital() {
    return SignInState(
        email: EmailInput.pure(),
        password: PasswordInput.pure(),
        status: FormzSubmissionStatus.initial);
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];

  SignInState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
