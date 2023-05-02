abstract class SignUpEvent {
  const SignUpEvent();
}

class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}
