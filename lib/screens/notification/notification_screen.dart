import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/screens/notification/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: NotificationAppBar(),
        preferredSize: Size.fromHeight(90.w),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => NotificationCard(
          notification: NotificationModel(
            createdDate: DateTime.now(),
            id: '1',
            title: 'Payment Successfully',
            subTitle:
                "You have successfully booked the Art Workshops. The event will be held on Sunday, December 22, 2022, 13.00 - 14.00 PM. Don't forget to activate your reminder. Enjoy the event!",
            isRead: false,
            type: NotificationType.PAYMENT_SUCCESS,
          ),
        ),
      ),
    );
  }
}
