import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/screens/notification/cubit/notification_cubit.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return InkWell(
          onTap: () =>
              context.read<NotificationCubit>().readItem(notification.id),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: notification.type.color.withOpacity(0.08),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Icon(
                          notification.type.icon,
                          size: 28,
                          color: notification.type.color,
                        ),
                      ),
                      notification.isRead
                          ? Container()
                          : Positioned(
                              right: 4.w,
                              top: 4.w,
                              child: Container(
                                height: 10.w,
                                width: 10.w,
                                decoration: BoxDecoration(
                                  //color: AppColors.lightColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 7.w,
                                    width: 7.w,
                                    decoration: BoxDecoration(
                                      color: StatusType.ERROR.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notification.title,
                          style: AppTextStyle.h5(),
                        ),
                        SizedBox(
                          height: 6.w,
                        ),
                        Row(
                          children: [
                            Text(
                              formatDateTime(
                                dateTime: notification.createdDate,
                                mode: 'dd MMM yyyy',
                              ),
                              style: AppTextStyle.bodyMedium(
                                FontWeight.w500,
                                AppColors.greyScaleColor[700],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              '|',
                              style: AppTextStyle.bodyMedium(
                                FontWeight.w500,
                                AppColors.greyScaleColor[700],
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              formatDateTime(
                                dateTime: notification.createdDate,
                                mode: DateFormat.HOUR24_MINUTE,
                              ),
                              style: AppTextStyle.bodyMedium(
                                FontWeight.w500,
                                AppColors.greyScaleColor[700],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(
                notification.subTitle ?? '',
                style: AppTextStyle.bodyMedium(
                  FontWeight.normal,
                  AppColors.greyScaleColor[800],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
