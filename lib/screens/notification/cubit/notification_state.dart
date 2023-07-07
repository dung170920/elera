part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState._({
    this.status = LoadStatus.loading,
    this.items = const <NotificationModel>[],
    this.errorMessage,
  });

  const NotificationState.loading() : this._();

  const NotificationState.success(List<NotificationModel> items)
      : this._(status: LoadStatus.success, items: items);

  const NotificationState.failure(String message)
      : this._(status: LoadStatus.failure, errorMessage: message);

  final LoadStatus status;
  final List<NotificationModel> items;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, items, errorMessage];
}
