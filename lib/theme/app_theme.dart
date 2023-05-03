import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightColor,
    textTheme: Typography.englishLike2018.apply(
        fontSizeFactor: 1.sp,
        bodyColor: AppColors.greyScaleColor[900],
        fontFamily: GoogleFonts.urbanist().fontFamily),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: AppColors.lightColor),
    iconTheme: IconThemeData(color: AppColors.greyScaleColor[900]),
    dialogBackgroundColor: AppColors.lightColor,
    unselectedWidgetColor: AppColors.greyScaleColor[500],
    dividerTheme: DividerThemeData(
      color: AppColors.greyScaleColor[200],
    ),
    cardColor: AppColors.lightColor,
    dialogTheme: DialogTheme(shape: shapeRadius()),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.greyScaleColor[900],
      ),
      elevation: 0,
      backgroundColor: AppColors.lightColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.lightColor),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.greyScaleColor[50]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.greyScaleColor[50]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.statusColor[StatusEnum.ERROR]!),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkColor[1],
    textTheme: Typography.englishLike2018.apply(
        fontSizeFactor: 1.sp,
        bodyColor: AppColors.lightColor,
        fontFamily: GoogleFonts.urbanist().fontFamily),
    bottomNavigationBarTheme:
        BottomNavigationBarThemeData(backgroundColor: AppColors.darkColor[1]),
    iconTheme: IconThemeData(color: AppColors.lightColor),
    dialogBackgroundColor: AppColors.lightColor,
    unselectedWidgetColor: AppColors.greyScaleColor[500],
    dividerTheme: DividerThemeData(
      color: AppColors.darkColor[3],
    ),
    cardColor: AppColors.darkColor[2],
    dialogTheme: DialogTheme(shape: shapeRadius()),
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.darkColor[1]),
  );
}
