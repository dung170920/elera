part of 'info_edit_cubit.dart';

class InfoEditState extends Equatable {
  final EmailInput email;
  final TextInput name;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const InfoEditState({
    required this.email,
    required this.name,
    required this.status,
    this.errorMessage,
  });

  factory InfoEditState.inital() {
    return InfoEditState(
      email: EmailInput.pure(),
      name: TextInput.pure(),
      status: FormzSubmissionStatus.initial,
    );
  }

  @override
  List<Object?> get props => [email, name, status, errorMessage];

  InfoEditState copyWith({
    EmailInput? email,
    TextInput? name,
    FormzSubmissionStatus? status,
    String? errorMessage,
  }) {
    return InfoEditState(
      email: email ?? this.email,
      name: name ?? this.name,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
