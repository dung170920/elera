import 'package:bloc/bloc.dart';
import 'package:elera/theme/theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(theme: AppTheme.lightTheme));

  void switchTheme() {
    state.theme == AppTheme.lightTheme
        ? emit(state.copyWith(theme: AppTheme.darkTheme))
        : emit(state.copyWith(theme: AppTheme.lightTheme));
  }
}
