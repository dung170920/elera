import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/home/bloc/home_bloc.dart';
import 'package:elera/screens/inbox/bloc/inbox_bloc.dart';
import 'package:elera/screens/let_in/bloc/let_in_bloc.dart';
import 'package:elera/screens/my_course/bloc/my_course_bloc.dart';
import 'package:elera/screens/profile/bloc/profile_bloc.dart';
import 'package:elera/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:elera/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:elera/screens/splash/bloc/splash_bloc.dart';
import 'package:elera/screens/transaction/bloc/transaction_bloc.dart';
import 'package:elera/screens/welcome/bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elera/screens/screens.dart';

class AppPages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static List<RouteModel> Routes() {
    final AuthService _authService = AuthService();
    return [
      RouteModel(
        path: AppRoutes.SPLASH,
        page: SplashScreen(),
        bloc: BlocProvider(
          create: (_) => SplashBloc(authService: _authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.WELCOME,
        page: WelcomeScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => WelcomeBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.LET_IN,
        page: LetInScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => LetInBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.SIGN_IN,
        page: SignInScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => SignInBloc(_authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.SIGN_UP,
        page: SignUpScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => SignUpBloc(_authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.HOME,
        page: HomeScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => HomeBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.MY_COURSE,
        page: MyCourseScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => MyCourseBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.INBOX,
        page: InboxScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => InboxBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.TRANSACTION,
        page: TransactionScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => TransactionBloc(),
        ),
      ),
      RouteModel(
        path: AppRoutes.PROFILE,
        page: ProfileScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => ProfileBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> BlocList(BuildContext context) {
    List<dynamic> list = [];
    for (var route in Routes()) {
      list.add(route.bloc);
    }
    return list;
  }

  static Route GenerateRouteSettings(RouteSettings settings) {
    var route = Routes().where((element) => element.path == settings.name);
    bool firstTime =
        Global.storageService.getBool(Preferences.OPEN_FIRST_TIME_KEY);

    return MaterialPageRoute(
        builder: (_) => BlocListener<SplashBloc, SplashState>(
              listener: (context, state) {
                if (state.status == AuthStatus.authenticated)
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.HOME, (route) => false);

                if (state.status == AuthStatus.unAuthenticated)
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      !firstTime ? AppRoutes.WELCOME : AppRoutes.LET_IN,
                      (route) => false);
              },
              child: route.first.page,
            ),
        settings: settings);
  }
}
