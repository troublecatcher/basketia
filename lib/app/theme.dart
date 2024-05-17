import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final theme = ThemeData(
  highlightColor: Colors.transparent,
  splashFactory: NoSplash.splashFactory,
  useMaterial3: false,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(191, 90, 242, 1),
  disabledColor: const Color.fromRGBO(235, 235, 245, 0.6),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 36.sp,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 15.sp,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 17.sp,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15.sp,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 19.sp,
    ),
    labelMedium: TextStyle(
      color: const Color.fromRGBO(235, 235, 245, 0.6),
      fontWeight: FontWeight.w600,
      fontSize: 17.sp,
    ),
    labelSmall: TextStyle(
      color: const Color.fromRGBO(235, 235, 245, 0.6),
      fontWeight: FontWeight.w600,
      fontSize: 13.sp,
    ),
  ),
);

const surfaceColor = Color.fromRGBO(28, 28, 30, 1);
