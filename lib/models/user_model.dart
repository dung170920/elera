import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? fullName;
  final String? avatar;
  final String? phone;
  final DateTime? dob;

  const UserModel(
      {required this.id,
      this.email,
      this.fullName,
      this.avatar,
      this.phone,
      this.dob});

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, fullName, email, avatar, phone, dob];

  UserModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? avatar,
    String? phone,
    DateTime? dob,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] != null ? map['email'] as String : null,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      dob: map['dob'] != null ? DateTime.parse(map['dob']) : null,
    );
  }
}
