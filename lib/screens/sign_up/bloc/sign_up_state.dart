class SignUpState {
  final String email;
  final String password;

  const SignUpState({this.email = '', this.password = ''});

  SignUpState copyWith({
    String? email,
    String? password,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
