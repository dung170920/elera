part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final ThemeData theme;
  const ProfileState({required this.theme});

  @override
  List<Object> get props => [theme];

  ProfileState copyWith({
    ThemeData? theme,
  }) {
    return ProfileState(
      theme: theme ?? this.theme,
    );
  }
}
