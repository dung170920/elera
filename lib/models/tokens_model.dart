import 'package:equatable/equatable.dart';

class TokensModel extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  TokensModel({this.accessToken, this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];

  TokensModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return TokensModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory TokensModel.fromJson(Map<String, dynamic> map) {
    return TokensModel(
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }
}
