import 'package:elera/theme/theme.dart';
import 'package:elera/utils/utils.dart';
import 'package:elera/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightColor,
    textTheme: Typography.englishLike2014.apply(
      fontSizeFactor: 1.sp,
      bodyColor: AppColors.greyScaleColor[900],
      displayColor: AppColors.greyScaleColor[900],
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightColor,
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: AppColors.greyScaleColor[900]),
    unselectedWidgetColor: AppColors.greyScaleColor[500],
    dividerTheme: DividerThemeData(
      color: AppColors.greyScaleColor[200],
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    cardColor: AppColors.lightColor,
    dialogTheme: DialogTheme(
      shape: shapeRadius(24),
      backgroundColor: AppColors.lightColor,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: AppTextStyle.h4(AppColors.greyScaleColor[900]),
      iconTheme: IconThemeData(
        color: AppColors.greyScaleColor[900],
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    chipTheme: ChipThemeData(
      labelStyle: AppTextStyle.bodyLarge(
        FontWeight.w600,
        AppColors.primaryColor,
      ),
      labelPadding: EdgeInsets.zero,
      pressElevation: 0,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      backgroundColor: AppColors.lightColor,
      selectedColor: AppColors.primaryColor,
      secondaryLabelStyle: AppTextStyle.bodyLarge(
        FontWeight.w600,
        AppColors.lightColor,
      ),
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.lightColor),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.greyScaleColor[50]!,
      iconColor: AppColors.greyScaleColor[900],
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
        borderSide: BorderSide(
          color: StatusType.ERROR.color,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.lightColor,
        disabledBackgroundColor: AppColors.greyScaleColor[100]!,
        foregroundColor: AppColors.greyScaleColor[900],
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.greyScaleColor[200]!,
            width: 1,
          ),
        ),
        elevation: 0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: createMaterialColor(AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkColor[1],
    textTheme: Typography.englishLike2014.apply(
      displayColor: AppColors.lightColor,
      fontSizeFactor: 1.sp,
      bodyColor: AppColors.lightColor,
      fontFamily: GoogleFonts.urbanist().fontFamily,
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkColor[1],
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: AppColors.lightColor),
    unselectedWidgetColor: AppColors.greyScaleColor[500],
    dividerTheme: DividerThemeData(
      color: AppColors.darkColor[3],
    ),
    chipTheme: ChipThemeData(
      labelStyle: AppTextStyle.bodyLarge(
        FontWeight.w600,
        AppColors.primaryColor,
      ),
      labelPadding: EdgeInsets.zero,
      pressElevation: 0,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      backgroundColor: AppColors.darkColor[1],
      shape: StadiumBorder(
        side: BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
    ),
    cardColor: AppColors.darkColor[2],
    dialogTheme: DialogTheme(
      shape: shapeRadius(24),
      backgroundColor: AppColors.darkColor[2],
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: AppTextStyle.h4(AppColors.lightColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.darkColor[1]),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.darkColor[2],
        disabledBackgroundColor: AppColors.greyScaleColor[700]!,
        foregroundColor: AppColors.lightColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.darkColor[3]!,
            width: 1,
          ),
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkColor[2],
      iconColor: AppColors.lightColor,
      border: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(
          color: AppColors.darkColor[2]!,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(
          color: AppColors.darkColor[2]!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(
          color: StatusType.ERROR.color,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radiusCircular(12),
        gapPadding: 12.w,
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}
