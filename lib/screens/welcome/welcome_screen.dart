import 'package:elera/routes/routes.dart';
import 'package:elera/screens/welcome/widgets/widgets.dart';
import 'package:elera/services/services.dart';
import 'package:elera/constants/constants.dart';
import 'package:elera/utils/global.dart';
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
              children: Data.getWelcomeList()
                  .map(
                    (e) => PageItem(
                      item: e,
                      index: state.page,
                      total: Data.getWelcomeList().length,
                      onTap: () {
                        if (state.page < Data.getWelcomeList().length - 1) {
                          state.page += 1;
                          context.read<WelcomeBloc>().add(WelcomeEvent());
                          pageController.animateToPage(state.page,
                              duration: Duration(microseconds: 500),
                              curve: Curves.bounceIn);
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
