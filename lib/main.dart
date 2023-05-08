import 'package:elera/routes/pages.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
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
        builder: (_, child) => MaterialApp(
          // navigatorKey: navigatorKey,
          title: 'Elera',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.SPLASH,
          //navigatorObservers: [AppPages.observer],
          onGenerateRoute: AppPages.GenerateRouteSettings,
          theme: AppTheme.lightTheme,
          builder: (context, child) => ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
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
