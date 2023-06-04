import 'package:equatable/equatable.dart';

class CourseTypeModel extends Equatable {
  final String id;
  final String name;

  CourseTypeModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  CourseTypeModel copyWith({
    String? id,
    String? name,
  }) {
    return CourseTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CourseTypeModel.fromJson(Map<String, dynamic> map) {
    return CourseTypeModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
