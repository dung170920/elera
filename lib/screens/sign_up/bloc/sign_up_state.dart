class SignUpState {
  final String fullName;
  final String email;
  final String password;
  final String rePassword;

  const SignUpState({
    this.email = '',
    this.password = '',
    this.fullName = '',
    this.rePassword = '',
  });

  SignUpState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
