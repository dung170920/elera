import 'package:equatable/equatable.dart';
import 'package:elera/models/models.dart';

class CourseSectionCardModel extends Equatable {
  final String id;
  final String? title;
  final List<CourseLessonModel>? lessons;
  final int? sectionDuration;
  final int? totalLesson;

  CourseSectionCardModel(
      {required this.id,
      this.title,
      this.lessons,
      this.sectionDuration,
      this.totalLesson});

  @override
  List<Object?> get props => [id, title, lessons, sectionDuration, totalLesson];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'lessons': lessons,
      'sectionDuration': sectionDuration,
      'totalLesson': totalLesson,
    };
  }

  factory CourseSectionCardModel.fromJson(Map<String, dynamic> map) {
    final list = <CourseLessonModel>[];
    if (map['lessons'] != null) {
      map['lessons']
          .forEach((lesson) => list.add(CourseLessonModel.fromJson(lesson)));
    }
    return CourseSectionCardModel(
      id: map['id'],
      title: map['title'],
      sectionDuration: map['sectionDuration'],
      totalLesson: map['totalLesson'],
      lessons: list,
    );
  }

  CourseSectionCardModel copyWith({
    String? id,
    String? title,
    List<CourseLessonModel>? lessons,
    int? sectionDuration,
    int? totalLesson,
  }) {
    return CourseSectionCardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      lessons: lessons ?? this.lessons,
      sectionDuration: sectionDuration ?? this.sectionDuration,
      totalLesson: totalLesson ?? this.totalLesson,
    );
  }
}
