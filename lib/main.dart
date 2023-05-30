import 'dart:io';
import 'package:elera/routes/pages.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/profile/cubit/profile_cubit.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  await Global.init();
  runApp(const MyApp());
}

// final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...AppPages.BlocList(context),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return MaterialApp(
              // navigatorKey: navigatorKey,
              title: 'Elera',
              debugShowCheckedModeBanner: false,
              initialRoute: AppRoutes.SPLASH,
              onGenerateRoute: AppPages.GenerateRouteSettings,
              theme: state.theme,
              builder: (context, child) => ScrollConfiguration(
                behavior: MyBehavior(),
                child: child!,
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
