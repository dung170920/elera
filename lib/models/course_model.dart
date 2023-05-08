import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String id;
  final String? type;
  final String? name;
  final String? img;
  final double? price;
  final double? salePrice;
  final double? rate;
  final int? totalRate;

  const CourseModel({
    required this.id,
    this.type,
    this.name,
    this.img,
    this.price,
    this.salePrice,
    this.rate,
    this.totalRate,
  });

  static const empty = CourseModel(id: '');

  bool get isEmpty => this == CourseModel.empty;
  bool get isNotEmpty => this != CourseModel.empty;

  @override
  List<Object?> get props =>
      [id, name, type, img, price, salePrice, rate, totalRate];
}
