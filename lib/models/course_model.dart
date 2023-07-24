import 'package:equatable/equatable.dart';
import 'package:elera/models/models.dart';

class CourseModel extends Equatable {
  final String id;
  final CourseTypeModel? type;
  final UserModel? mentor;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? trailerUrl;
  final double? price;
  final double? rating;
  final DateTime? createdAt;
  final bool? isDisable;
  final int? studentsCount;
  final int? reviewsCount;
  final bool? isBookmarked;
  final int? courseDuration;

  const CourseModel({
    required this.id,
    this.type,
    this.mentor,
    this.title,
    this.description,
    this.imageUrl,
    this.trailerUrl,
    this.price,
    this.isDisable,
    this.rating,
    this.createdAt,
    this.courseDuration,
    this.isBookmarked,
    this.studentsCount,
    this.reviewsCount,
  });

  static const empty = CourseModel(id: "");

  bool get isEmpty => this == CourseModel.empty;
  bool get isNotEmpty => this != CourseModel.empty;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        type,
        mentor,
        imageUrl,
        trailerUrl,
        price,
        isDisable,
        rating,
        courseDuration,
        createdAt,
        studentsCount,
        reviewsCount,
        isBookmarked
      ];

  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      type: map['courseType'] != null
          ? CourseTypeModel.fromJson(map['courseType'] as Map<String, dynamic>)
          : null,
      mentor: map['mentor'] != null
          ? UserModel.fromJson(map['mentor'] as Map<String, dynamic>)
          : null,
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      trailerUrl: map['trailerUrl'],
      price: map['price'] != null ? map['price'].toDouble() : null,
      rating: map['rating'] != null ? map['rating'].toDouble() : null,
      isDisable: map['isDisable'],
      createdAt: map['createdAt'],
      studentsCount: map['studentsCount'],
      reviewsCount: map['reviewsCount'],
      courseDuration: map['courseDuration'],
      isBookmarked: map['isBookmarked'],
    );
  }

  CourseModel copyWith({
    String? id,
    CourseTypeModel? type,
    UserModel? mentor,
    String? title,
    String? description,
    String? imageUrl,
    String? trailerUrl,
    double? price,
    double? rating,
    DateTime? createdAt,
    bool? isDisable,
    int? studentsCount,
    int? reviewsCount,
    bool? isBookmarked,
    int? courseDuration,
  }) {
    return CourseModel(
      id: id ?? this.id,
      type: type ?? this.type,
      mentor: mentor ?? this.mentor,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
      isDisable: isDisable ?? this.isDisable,
      studentsCount: studentsCount ?? this.studentsCount,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      courseDuration: courseDuration ?? this.courseDuration,
    );
  }
}
