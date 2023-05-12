import 'dart:convert';
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

  CourseModel copyWith({
    String? id,
    String? type,
    String? name,
    String? img,
    double? price,
    double? salePrice,
    double? rate,
    int? totalRate,
  }) {
    return CourseModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      img: img ?? this.img,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      rate: rate ?? this.rate,
      totalRate: totalRate ?? this.totalRate,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'img': img,
      'price': price,
      'salePrice': salePrice,
      'rate': rate,
      'totalRate': totalRate,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: map['id'] as String,
      type: map['type'] != null ? map['type'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      salePrice: map['salePrice'] != null ? map['salePrice'] as double : null,
      rate: map['rate'] != null ? map['rate'] as double : null,
      totalRate: map['totalRate'] != null ? map['totalRate'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
