import 'package:elera/models/models.dart';
import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String id;
  final CourseTypeModel? type;
  final UserModel? mentor;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? trailerUrl;
  final double? price;
  final double? rate;
  final bool? isDisable;
  final int? studentsCount;
  final int? reviewsCount;

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
    this.rate,
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
        rate,
        studentsCount,
        reviewsCount,
      ];

  CourseModel copyWith({
    String? id,
    CourseTypeModel? type,
    String? title,
    UserModel? mentor,
    String? description,
    String? imageUrl,
    String? trailerUrl,
    double? price,
    bool? isDisable,
    double? rate,
    int? studentsCount,
    int? reviewsCount,
  }) {
    return CourseModel(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      price: price ?? this.price,
      mentor: mentor ?? this.mentor,
      rate: rate ?? this.rate,
      studentsCount: studentsCount ?? this.studentsCount,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isDisable: isDisable ?? this.isDisable,
    );
  }

  factory CourseModel.fromJson(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'],
      type: map['courseType'] != null
          ? CourseTypeModel.fromJson(map['courseType'] as Map<String, dynamic>)
          : null,
      mentor: map['mentor'] != null
          ? UserModel.fromJson(map['mentor'] as Map<String, dynamic>)
          : null,
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      trailerUrl:
          map['trailerUrl'] != null ? map['trailerUrl'] as String : null,
      price: map['price'] != null ? map['price'].toDouble() : null,
      rate: map['rate'] != null ? map['rate'].toDouble() : null,
      isDisable: map['isDisable'] != null ? map['isDisable'] as bool : null,
      studentsCount:
          map['studentsCount'] != null ? map['studentsCount'] as int : null,
      reviewsCount:
          map['reviewsCount'] != null ? map['reviewsCount'] as int : null,
    );
  }
}
