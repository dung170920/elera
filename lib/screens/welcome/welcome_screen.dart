import 'package:elera/routes/routes.dart';
import 'package:elera/screens/welcome/widgets/widgets.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elera/screens/welcome/cubit/welcome_cubit.dart';

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
        child: BlocBuilder<WelcomeCubit, WelcomeState>(
          builder: (context, state) {
            return PageView(
              controller: pageController,
              onPageChanged: (value) {
                context.read<WelcomeCubit>().onPageChange(value);
              },
              children: Data.getWelcomeList()
                  .map(
                    (e) => PageItem(
                      item: e,
                      index: state.index,
                      total: Data.getWelcomeList().length,
                      onTap: () {
                        if (state.index < Data.getWelcomeList().length - 1) {
                          pageController.animateToPage(state.index + 1,
                              duration: Duration(microseconds: 500),
                              curve: Curves.bounceIn);
                          context
                              .read<WelcomeCubit>()
                              .onPageChange(state.index + 1);
                          print(state.index);
                        } else {
                          Global.storageService
                              .setBool(Preferences.OPEN_FIRST_TIME_KEY, true);
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.LET_IN,
                          );
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
