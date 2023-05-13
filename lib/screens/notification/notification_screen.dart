import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/screens/notification/cubit/notification_cubit.dart';
import 'package:elera/screens/notification/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          switch (state.status) {
            case ListStatus.loading:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ListStatus.success:
              return state.items.isEmpty
                  ? Center(
                      child: Text('List is empty!'),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.all(24.w),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) => NotificationCard(
                        notification: state.items[index],
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 24.w,
                      ),
                    );

            case ListStatus.failure:
              return Center(
                child: Text('Something went wrong!'),
              );
          }
        },
      ),
    );
  }
}
