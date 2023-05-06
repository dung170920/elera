import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () => context.read<SplashCubit>().onAuthLogoutRequested(),
          child: Text('log out'),
        ),
      ),
    );
  }
}
