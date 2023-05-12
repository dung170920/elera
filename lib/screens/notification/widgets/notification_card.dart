import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/widgets.dart';
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
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: state.theme == AppTheme.lightTheme
                ? AppColors.lightColor
                : AppColors.darkColor[2],
            borderRadius: radiusCircular(AppStyles.DEFAULT_LARGE_RADIUS),
            boxShadow: [
              AppStyles.cardShadow[2]!,
            ],
          ),
          width: double.maxFinite,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: notification.type.color,
                ),
                padding: EdgeInsets.all(16.w),
                child: Icon(
                  notification.type.icon,
                  size: 28,
                ),
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
                            mode: DateFormat.YEAR_ABBR_MONTH_DAY,
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
        );
      },
    );
  }
}
