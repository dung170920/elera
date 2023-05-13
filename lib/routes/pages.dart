import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/home/cubit/home_cubit.dart';
import 'package:elera/screens/inbox/cubit/inbox_cubit.dart';
import 'package:elera/screens/info/cubit/info_cubit.dart';
import 'package:elera/screens/let_in/cubit/let_in_cubit.dart';
import 'package:elera/screens/my_course/cubit/my_course_cubit.dart';
import 'package:elera/screens/notification/cubit/notification_cubit.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:elera/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/screens/transaction/cubit/transaction_cubit.dart';
import 'package:elera/screens/welcome/cubit/welcome_cubit.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elera/screens/screens.dart';

class AppPages {
  static List<RouteModel> Routes() {
    final AuthService _authService = AuthService();
    return [
      RouteModel(
        path: AppRoutes.SPLASH,
        page: SplashScreen(),
        bloc: BlocProvider(
          create: (_) => SplashCubit(authService: _authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.WELCOME,
        page: WelcomeScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => WelcomeCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.LET_IN,
        page: LetInScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => LetInCubit(_authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.SIGN_IN,
        page: SignInScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => SignInCubit(_authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.SIGN_UP,
        page: SignUpScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => SignUpCubit(_authService),
        ),
      ),
      RouteModel(
        path: AppRoutes.HOME,
        page: HomeScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => HomeCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.MY_COURSE,
        page: MyCourseScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => MyCourseCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.INBOX,
        page: InboxScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => InboxCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.TRANSACTION,
        page: TransactionScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => TransactionCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.PROFILE,
        page: ProfileScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => ProfileCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.INFO,
        page: InfoScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => InfoCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.NOTIFICATION,
        page: NotificationScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => NotificationCubit(
            service: NotificationService(),
          )..fetchList(),
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
        builder: (_) => BlocListener<SplashCubit, SplashState>(
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
