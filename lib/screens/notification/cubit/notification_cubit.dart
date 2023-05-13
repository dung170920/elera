import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit({required this.service})
      : super(NotificationState.loading());

  final NotificationService service;

  Future<void> fetchList() async {
    try {
      final items = await service.loadNotifications();
      emit(NotificationState.success(items));
    } on AppExceptions catch (e) {
      emit(NotificationState.failure(e.message));
    }
  }

  Future<void> deleteList() async {
    //emit(const NotificationState.loading());
    try {
      await service
          .removeNotifications()
          .then((_) => emit(NotificationState.success([])));
    } on AppExceptions catch (e) {
      emit(NotificationState.failure(e.message));
    }
  }

  Future<void> readItem(String id) async {
    try {
      service.readNotification(id).then((_) {
        final list = state.items.map((item) {
          return item.id == id ? item.copyWith(isRead: true) : item;
        }).toList();
        emit(NotificationState.success(list));
      });
    } on AppExceptions catch (e) {
      emit(NotificationState.failure(e.message));
    }
  }

  Future<void> readList() async {
    try {
      await service.readNotifications().then((_) {
        final list = state.items.map((item) {
          return item.copyWith(isRead: true);
        }).toList();
        emit(NotificationState.success(list));
      });
    } on AppExceptions catch (e) {
      emit(NotificationState.failure(e.message));
    }
  }
}
