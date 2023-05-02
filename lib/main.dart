import 'package:elera/routes/pages.dart';
import 'package:elera/routes/routes.dart';
import 'package:elera/screens/screens.dart';
import 'package:elera/screens/welcome/bloc/bloc.dart';
import 'package:elera/screens/sign_in/bloc/bloc.dart';
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
        builder: (context, child) => MaterialApp(
          title: 'Elera',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.WELCOME,
          navigatorObservers: [AppPages.observer],
          onGenerateRoute: AppPages.GenerateRouteSettings,
          builder: (context, child) =>
              ScrollConfiguration(behavior: MyBehavior(), child: child!),
          theme: AppTheme.lightTheme,
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
