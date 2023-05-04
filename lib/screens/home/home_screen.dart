import 'package:elera/screens/home/bloc/home_bloc.dart';
import 'package:elera/screens/home/widgets/widgets.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Data.getPage(context.read<HomeBloc>().state.index),
          ),
          bottomNavigationBar: HomeBottomBar(),
        );
      },
    );
  }
}
