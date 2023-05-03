import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? avatar;
  final String? phoneNumber;

  const UserModel(
      {required this.id, this.email, this.name, this.avatar, this.phoneNumber});

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, name, email, avatar, phoneNumber];
}
