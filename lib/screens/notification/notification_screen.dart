import 'package:elera/constants/constants.dart';
import 'package:magicon/magicon.dart';
import 'package:elera/widgets/widgets.dart';
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
      appBar: NavBar(
        isBack: true,
        title: 'Notification',
        actions: [
          GestureDetector(
            onTap: () {
              showMenu(
                context: context,
                position: RelativeRect.fromLTRB(1.sw, 90.w, 24.w, 1.sw),
                items: [
                  PopupMenuItem(
                    onTap: () => context.read<NotificationCubit>().readList(),
                    child: Row(
                      children: [
                        Icon(
                          Magicon.checkDouble,
                          color: StatusType.SUCCESS.color,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('Read as all'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => context.read<NotificationCubit>().deleteList(),
                    child: Row(
                      children: [
                        Icon(
                          Magicon.trash,
                          color: StatusType.ERROR.color,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text('Remove all'),
                      ],
                    ),
                  )
                ],
              );
            },
            child: Icon(
              Magicon.moreHorizontalCircle,
              size: 28.w,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            switch (state.status) {
              case LoadStatus.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case LoadStatus.success:
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

              case LoadStatus.failure:
                return Center(
                  child: Text('Something went wrong!'),
                );
            }
          },
        ),
      ),
    );
  }
}
