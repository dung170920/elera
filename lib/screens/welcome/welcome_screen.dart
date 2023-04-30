import 'package:elera/screens/welcome/widgets/widgets.dart';
import 'package:elera/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elera/screens/welcome/bloc/bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return PageView(
              controller: pageController,
              onPageChanged: (value) {
                state.page = value;
                context.read<WelcomeBloc>().add(WelcomeEvent());
              },
              children: getWelcomeList()
                  .map(
                    (e) => PageItem(
                      item: e,
                      index: state.page,
                      total: getWelcomeList().length,
                      onTap: () {
                        if (state.page < getWelcomeList().length - 1) {
                          state.page += 1;
                          context.read<WelcomeBloc>().add(WelcomeEvent());
                          pageController.animateToPage(state.page,
                              duration: Duration(microseconds: 300),
                              curve: Curves.bounceIn);
                        }
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
