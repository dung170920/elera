import 'package:elera/constants/constants.dart';
import 'package:elera/models/models.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/course_detail/cubit/course_detail_cubit.dart';
import 'package:elera/screens/courses/cubit/courses_cubit.dart';
import 'package:elera/screens/home/cubit/home_cubit.dart';
import 'package:elera/screens/inbox/cubit/inbox_cubit.dart';
import 'package:elera/screens/info_edit/cubit/info_edit_cubit.dart';
import 'package:elera/screens/let_in/cubit/let_in_cubit.dart';
import 'package:elera/screens/mentor_detail/cubit/mentor_detail_cubit.dart';
import 'package:elera/screens/mentors/cubit/mentors_cubit.dart';
import 'package:elera/screens/my_courses/cubit/my_courses_cubit.dart';
import 'package:elera/screens/notification/cubit/notification_cubit.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/screens/sign_in/cubit/sign_in_cubit.dart';
import 'package:elera/screens/sign_up/cubit/sign_up_cubit.dart';
import 'package:elera/screens/splash/cubit/splash_cubit.dart';
import 'package:elera/screens/transaction/cubit/transaction_cubit.dart';
import 'package:elera/screens/welcome/cubit/welcome_cubit.dart';
import 'package:elera/services/services.dart';
import 'package:elera/utils/utils.dart';
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
          create: (_) => SplashCubit(
              authService: _authService, userService: UserService()),
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
          create: (_) => HomeCubit(CourseService())..init(),
        ),
      ),
      RouteModel(
        path: AppRoutes.MY_COURSES,
        page: MyCoursesScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => MyCoursesCubit(),
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
        path: AppRoutes.INFO_EDIT,
        page: InfoEditScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => InfoEditCubit(),
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
      RouteModel(
        path: AppRoutes.COURSES,
        page: CoursesScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) =>
              CoursesCubit(CourseService(), CourseTypeService())..init(),
        ),
      ),
      RouteModel(
        path: AppRoutes.COURSE_DETAIL,
        page: CourseDetailScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => CourseDetailCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.MENTORS,
        page: MentorsScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => MentorsCubit(),
        ),
      ),
      RouteModel(
        path: AppRoutes.MENTOR_DETAIL,
        page: MentorDetailScreen(),
        bloc: BlocProvider(
          lazy: true,
          create: (_) => MentorDetailCubit(),
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
        listener: (context, state) async {
          if (state.status == AuthStatus.authenticated) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.HOME, (route) => false);
          }

          if (state.status == AuthStatus.unAuthenticated)
            Navigator.pushNamedAndRemoveUntil(
                context,
                !firstTime ? AppRoutes.WELCOME : AppRoutes.LET_IN,
                (route) => false);
        },
        child: route.first.page,
      ),
      settings: settings,
    );
  }
}
