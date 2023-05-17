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
  final int? numberVote;
  final double? totalDuration;

  const CourseModel({
    required this.id,
    this.type,
    this.name,
    this.img,
    this.price,
    this.salePrice,
    this.rate,
    this.numberVote,
    this.totalDuration,
  });

  static const empty = CourseModel(id: '');

  bool get isEmpty => this == CourseModel.empty;
  bool get isNotEmpty => this != CourseModel.empty;

  @override
  List<Object?> get props =>
      [id, name, type, img, price, salePrice, rate, numberVote, totalDuration];

  CourseModel copyWith({
    String? id,
    String? type,
    String? name,
    String? img,
    double? price,
    double? salePrice,
    double? rate,
    int? numberVote,
    double? totalDuration,
  }) {
    return CourseModel(
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      img: img ?? this.img,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      rate: rate ?? this.rate,
      numberVote: numberVote ?? this.numberVote,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'name': name,
      'img': img,
      'price': price,
      'salePrice': salePrice,
      'rate': rate,
      'numberVote': numberVote,
      'totalDuration': totalDuration,
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
      numberVote: map['numberVote'] != null ? map['numberVote'] as int : null,
      totalDuration:
          map['totalDuration'] != null ? map['totalDuration'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
