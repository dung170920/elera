import 'package:bloc/bloc.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(
          ProfileState(
            theme: Global.storageService.getString(Preferences.APP_MODE_KEY) ==
                    ThemeModes.dark
                ? AppTheme.darkTheme
                : AppTheme.lightTheme,
          ),
        );

  void switchTheme() {
    if (state.theme == AppTheme.lightTheme) {
      emit(state.copyWith(theme: AppTheme.darkTheme));
      Global.storageService
          .setString(Preferences.APP_MODE_KEY, ThemeModes.dark.name);
    } else {
      emit(state.copyWith(theme: AppTheme.lightTheme));
      Global.storageService
          .setString(Preferences.APP_MODE_KEY, ThemeModes.light.name);
    }
  }
}
