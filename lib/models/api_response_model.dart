import 'package:equatable/equatable.dart';

class ApiResponseModel<T> extends Equatable {
  final int code;
  final String message;
  final T result;

  ApiResponseModel(
      {required this.code, required this.message, required this.result});

  @override
  List<Object?> get props => [code, message, result];

  ApiResponseModel<T> copyWith({
    int? code,
    String? message,
    T? result,
  }) {
    return ApiResponseModel<T>(
      code: code ?? this.code,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  factory ApiResponseModel.fromJson(
      Map<String, dynamic> map, Function(Map<String, dynamic>) create) {
    return ApiResponseModel<T>(
      code: map['code'],
      message: map['message'],
      result: create(map['result']),
    );
  }
}
