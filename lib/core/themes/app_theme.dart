
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xffFAFDFB);
  static Color lightPrimaryColor = const Color(0xff3AC43C);
  static Color lightSecondaryColor = const Color(0xff007195);
  static Color lightTertiaryColor = const Color(0xff6E1747);
  static Color lightPrimaryContainerColor = const Color(0xffE5FFF8);
  static Color lightSecondaryContainerColor = const Color(0xffD3E4FF);

  static Color lightBodyFontColor = const Color(0xff191C1B);

   static Color lightSmallFontColor = const Color(0xff717D96);

  static Color darkBackgroundColor = const Color(0xff191C1B);
  static Color darkPrimaryColor = const Color(0xff004B30);
  static Color darkSecondaryColor = const Color(0xff001446);
  static Color darkTertiaryColor = const Color(0xffFC77A7);
  static Color darkPrimaryContainerColor = const Color(0xffE5FFF8);
  static Color darkSecondaryContainerColor = const Color(0xffD3E4FF);

  static Color darkBodyFontColor = const Color(0xffFAFDFB);
  static Color darkSmallFontColor = const Color(0xffD7D8DB);

  static Color greyContainer = const Color(0xffD2D3D3);
  static Color onError = const Color(0xffC13445);

  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
      tertiary: lightTertiaryColor,
      primaryContainer: lightPrimaryContainerColor,
      secondaryContainer: lightSecondaryContainerColor,
      tertiaryContainer: greyContainer,
      background: lightBackgroundColor,
      outline: lightBodyFontColor,
      outlineVariant: lightSmallFontColor,
      onError: onError,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      tertiary: darkTertiaryColor,
      primaryContainer: darkPrimaryContainerColor,
      secondaryContainer: darkSecondaryContainerColor,
      tertiaryContainer: greyContainer,
      background: darkBackgroundColor,
      outline: darkBodyFontColor,
      outlineVariant: darkSmallFontColor,
      onError: onError,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
      themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}