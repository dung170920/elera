import 'package:elera/routes/pages.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/home/home_screen.dart';
import 'package:elera/screens/screens.dart';
import 'package:elera/screens/splash/bloc/splash_bloc.dart';
import 'package:elera/screens/welcome/bloc/bloc.dart';
import 'package:elera/screens/sign_in/bloc/bloc.dart';
import 'package:elera/services/services.dart';
import 'package:elera/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
          title: 'Elera',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.SPLASH,
          //navigatorObservers: [AppPages.observer],
          onGenerateRoute: AppPages.GenerateRouteSettings,
          theme: AppTheme.lightTheme,
          builder: (context, child) => BlocListener<SplashBloc, SplashState>(
            listener: (context, state) {
              if (state.status == AuthStatus.authenticated)
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.HOME, (route) => false);

              if (state.status == AuthStatus.unAuthenticated)
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.LET_IN, (route) => false);
            },
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            ),
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
