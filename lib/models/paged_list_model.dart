import 'package:equatable/equatable.dart';

class PagedListModel<T> extends Equatable {
  final List<T> data;
  final int pageNumber;
  final int pageSize;
  final int total;

  const PagedListModel({
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.total,
  });

  @override
  List<Object?> get props => [data, pageNumber, pageSize, total];

  static PagedListModel<T> empty<T>() {
    return PagedListModel<T>(data: [], pageNumber: 1, pageSize: 10, total: 0);
  }

  bool get isEmpty => this == PagedListModel.empty();
  bool get isNotEmpty => this != PagedListModel.empty();

  PagedListModel<T> copyWith({
    List<T>? data,
    int? pageNumber,
    int? pageSize,
    int? total,
  }) {
    return PagedListModel<T>(
      data: data ?? this.data,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      total: total ?? this.total,
    );
  }

  factory PagedListModel.fromJson(
    Map<String, dynamic> map,
    Function(Map<String, dynamic>) create,
  ) {
    var data = <T>[];
    map['data'].forEach((v) {
      data.add(create(v));
    });
    return PagedListModel<T>(
      data: data,
      pageNumber: map['pageNumber'] as int,
      pageSize: map['pageSize'] as int,
      total: map['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };
  }
}
