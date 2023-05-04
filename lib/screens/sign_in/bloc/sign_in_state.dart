part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final Email email;
  final Password password;
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
        email: Email.pure(),
        password: Password.pure(),
        status: FormzSubmissionStatus.initial);
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];

  SignInState copyWith({
    Email? email,
    Password? password,
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
