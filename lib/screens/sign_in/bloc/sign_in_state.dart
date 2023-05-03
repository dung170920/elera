part of 'sign_in_bloc.dart';

// enum SignInStatus { initial, submitting, sucess, error }

class SignInState extends Equatable {
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;

  const SignInState(
      {required this.email, required this.password, required this.status});

  factory SignInState.inital() {
    return SignInState(
        email: Email.pure(),
        password: Password.pure(),
        status: FormzSubmissionStatus.initial);
  }

  @override
  List<Object?> get props => [email, password, status];

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
