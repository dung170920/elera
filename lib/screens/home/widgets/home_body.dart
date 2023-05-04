import 'package:elera/screens/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: () => context.read<SplashBloc>().add(AuthLogoutRequested()),
          child: Text('log out'),
        ),
      ),
    );
  }
}
