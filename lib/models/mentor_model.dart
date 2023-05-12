import 'dart:convert';
import 'package:equatable/equatable.dart';

class MentorModel extends Equatable {
  final String id;
  final String name;
  final String job;
  final String? avatar;

  const MentorModel({
    required this.id,
    required this.name,
    required this.job,
    this.avatar,
  });

  static const empty = MentorModel(id: '', name: '', job: '');

  bool get isEmpty => this == MentorModel.empty;
  bool get isNotEmpty => this != MentorModel.empty;

  @override
  List<Object?> get props => [id, name, job, avatar];

  MentorModel copyWith(
      {String? id, String? name, String? job, String? avatar}) {
    return MentorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      job: job ?? this.job,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'job': job,
    };
  }

  factory MentorModel.fromMap(Map<String, dynamic> map) {
    return MentorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      job: map['job'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MentorModel.fromJson(String source) =>
      MentorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MentorModel(id: $id, name: $name, job: $job)';
}
