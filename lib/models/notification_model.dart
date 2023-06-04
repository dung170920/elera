import 'package:equatable/equatable.dart';
import 'package:elera/constants/constants.dart';

class NotificationModel extends Equatable {
  final String id;
  final String title;
  final String? subTitle;
  final DateTime createdDate;
  final NotificationType type;
  final bool isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    this.subTitle,
    required this.createdDate,
    required this.type,
    required this.isRead,
  });

  @override
  List<Object?> get props => [id, title, subTitle, createdDate, type, isRead];

  NotificationModel copyWith({
    String? id,
    String? title,
    String? subTitle,
    DateTime? createdDate,
    NotificationType? type,
    bool? isRead,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      createdDate: createdDate ?? this.createdDate,
      type: type ?? this.type,
      isRead: isRead ?? this.isRead,
    );
  }
}
