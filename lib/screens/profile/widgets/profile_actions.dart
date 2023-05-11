import 'package:elera/constants/constants.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
            shrinkWrap: true,
            children: Data.getProfileActionList()
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      if (e.title == 'Dark Mode') {
                        context.read<ProfileCubit>().switchTheme();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(e.iconData, size: 24),
                                SizedBox(width: 16.w),
                                Text(
                                  e.title ?? '',
                                  style:
                                      AppTextStyle.bodyLarge(FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w),
                          e.title == 'Dark Mode'
                              ? Switch(
                                  value: state.theme != AppTheme.lightTheme,
                                  onChanged: (value) => context
                                      .read<ProfileCubit>()
                                      .switchTheme(),
                                )
                              : Icon(MyIcons.solidAngleRightSmall, size: 28),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
