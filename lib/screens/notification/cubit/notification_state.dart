part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState._({
    this.status = ListStatus.loading,
    this.items = const <NotificationModel>[],
    this.errorMessage,
  });

  const NotificationState.loading() : this._();

  const NotificationState.success(List<NotificationModel> items)
      : this._(status: ListStatus.success, items: items);

  const NotificationState.failure(String message)
      : this._(status: ListStatus.failure, errorMessage: message);

  final ListStatus status;
  final List<NotificationModel> items;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, items, errorMessage];
}
