part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;

  @override
  List<Object> get props => [email];

  const EmailEvent(this.email);
}

class PasswordEvent extends SignInEvent {
  final String password;

  @override
  List<Object> get props => [password];

  const PasswordEvent(this.password);
}

class SignInWithEmailAndPasswordEvent extends SignInEvent {}
