import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';

class NotificationService {
  final _notifications = <NotificationModel>[];

  Future<List<NotificationModel>> loadNotifications() =>
      Future.delayed(Duration(milliseconds: 800), () {
        _notifications.add(
          NotificationModel(
            createdDate: DateTime.now(),
            id: '1',
            title: 'Payment Successfully',
            subTitle:
                "You have successfully booked the Art Workshops. The event will be held on Sunday, December 22, 2022, 13.00 - 14.00 PM. Don't forget to activate your reminder. Enjoy the event!",
            isRead: false,
            type: NotificationType.PAYMENT_SUCCESS,
          ),
        );
        return _notifications;
      });

  Future<void> readNotifications() => Future.delayed(
        Duration(milliseconds: 800),
        () {},
      );

  Future<void> readNotification(String id) => Future.delayed(
        Duration(milliseconds: 800),
        () => {},
      );

  Future<void> removeNotifications() => Future.delayed(
        Duration(milliseconds: 800),
        () {},
      );
}
