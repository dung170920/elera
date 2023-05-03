part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, submitting, sucess, error }

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;
  final SignUpStatus status;

  const SignUpState(
      {required this.name,
      required this.email,
      required this.password,
      required this.status});

  factory SignUpState.inital() {
    return SignUpState(
        name: '', email: '', password: '', status: SignUpStatus.initial);
  }

  @override
  List<Object?> get props => [name, email, password, status];

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    SignUpStatus? status,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
