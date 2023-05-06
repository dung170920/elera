part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final TextInput name;
  final EmailInput email;
  final PasswordInput password;
  final PasswordInput rePassword;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const SignUpState({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.status,
    this.errorMessage,
  });

  factory SignUpState.inital() {
    return SignUpState(
      name: TextInput.pure(),
      email: EmailInput.pure(),
      password: PasswordInput.pure(),
      rePassword: PasswordInput.pure(),
      status: FormzSubmissionStatus.initial,
    );
  }

  @override
  List<Object?> get props =>
      [name, email, password, rePassword, status, errorMessage];

  SignUpState copyWith({
    TextInput? name,
    EmailInput? email,
    PasswordInput? password,
    PasswordInput? rePassword,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
