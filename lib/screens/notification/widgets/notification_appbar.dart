import 'package:elera/constants/constants.dart';
import 'package:elera/screens/notification/cubit/notification_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationAppBar extends StatelessWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: AppBar(
        leadingWidth: 28,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            MyIcons.arrowLeftSmall,
            size: 28.w,
          ),
        ),
        title: Text(
          'Notification',
        ),
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
                            MyIcons.checkDouble,
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
                      onTap: () =>
                          context.read<NotificationCubit>().deleteList(),
                      child: Row(
                        children: [
                          Icon(
                            MyIcons.trash,
                            color: StatusType.ERROR.color,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text('Remove all'),
                        ],
                      ),
                    )
                  ]);
            },
            child: Icon(
              MyIcons.moreHorizontalCircle,
              size: 28.w,
            ),
          ),
        ],
      ),
    );
  }
}
