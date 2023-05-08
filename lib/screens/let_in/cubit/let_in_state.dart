part of 'let_in_cubit.dart';

class LetInState extends Equatable {
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const LetInState({
    required this.status,
    this.errorMessage,
  });

  factory LetInState.inital() {
    return LetInState(status: FormzSubmissionStatus.initial);
  }

  @override
  List<Object?> get props => [status, errorMessage];

  LetInState copyWith({
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return LetInState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
