// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CourseLessonModel extends Equatable {
  final String id;
  final String? title;
  final int? duration;
  final String? videoUrl;

  CourseLessonModel(
      {required this.id, this.title, this.duration, this.videoUrl});

  @override
  List<Object?> get props => [id, title, duration, videoUrl];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'duration': duration,
      'videoUrl': videoUrl,
    };
  }

  factory CourseLessonModel.fromJson(Map<String, dynamic> map) {
    return CourseLessonModel(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      videoUrl: map['videoUrl'],
    );
  }

  CourseLessonModel copyWith({
    String? id,
    String? title,
    int? duration,
    String? videoUrl,
  }) {
    return CourseLessonModel(
      id: id ?? this.id,
      title: title ?? this.title,
      duration: duration ?? this.duration,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }
}
