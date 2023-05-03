part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class NameEvent extends SignUpEvent {
  final String name;

  const NameEvent(this.name);
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}

class SignUpWithEmailAndPasswordEvent extends SignUpEvent {}
