import 'package:customer_app/config/app_color/app_color.dart';
import 'package:customer_app/preferences/app_preferences.dart';
import 'package:customer_app/preferences/preferences_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin AppTheme {
  static ThemeData lightTheme = ThemeData(
    // fontFamily: 'DMSans',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    
    // applyElevationOverlayColor: true,
    // secondaryHeaderColor: AppColors.red,
    scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1),
    // splashColor: AppColors.grey1,
    appBarTheme:  AppBarTheme(
      backgroundColor: AppColors.appBgColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.black),
      shape: Border(bottom: BorderSide(color: AppColors.grey1)),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.textPrimary),
      bodyMedium: TextStyle(fontSize: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        backgroundColor: WidgetStateProperty.all(AppColors.primary),
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            // ignore: deprecated_member_use
            return AppColors.grey1.withOpacity(0.2); // pressed ripple
          }
          if (states.contains(WidgetState.hovered)) {
            // ignore: deprecated_member_use
            return AppColors.grey1.withOpacity(0.1); // hover effect
          }
          return null; // default
        }),
        minimumSize: WidgetStateProperty.all(const Size.fromHeight(50)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    // drawerTheme: const DrawerThemeData(
    //   backgroundColor: Color(0xffF5F7F9),
    //   elevation: 0,
    // ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: AppColors.grey1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: AppColors.grey1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
    ),
  );

  // static ThemeData darkTheme = ThemeData(
  //   fontFamily: 'DMSans',
  //   brightness: Brightness.dark,
  //   primaryColor: AppColors.primary,
  //   highlightColor: AppColors.white,
  //   applyElevationOverlayColor: true,
  //   secondaryHeaderColor: AppColors.red,
  //   scaffoldBackgroundColor: AppColors.black,
  //   focusColor: AppColors.grey2,
  //   cardColor: const Color(0xFF1E1E1E),
  //   canvasColor: Colors.red.shade300,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: AppColors.primary,
  //     brightness: Brightness.dark,
  //     errorContainer: Colors.grey.shade700,
  //     inversePrimary: Colors.grey.shade800,
  //     inverseSurface: AppColors.black1,
  //   ),
  //   iconTheme: IconThemeData(color: Colors.grey.shade800),
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Color(0xFF1E1E1E),
  //     surfaceTintColor: Colors.transparent,
  //     elevation: 0,
  //     centerTitle: true,
  //     iconTheme: IconThemeData(color: AppColors.white),
  //     titleTextStyle: TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.w700,
  //       color: AppColors.white,
  //       fontFamily: 'DMSans',
  //     ),
  //   ),
  //   textTheme: const TextTheme(
  //     headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  //     headlineMedium: TextStyle(
  //       fontSize: 24,
  //       fontWeight: FontWeight.w600,
  //       color: AppColors.white,
  //     ),
  //     labelSmall: TextStyle(
  //       fontSize: 14,
  //       fontWeight: FontWeight.w400,
  //       color: AppColors.white,
  //     ),
  //     bodyLarge: TextStyle(fontSize: 16, color: AppColors.white),
  //     bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
  //   ),
  //   drawerTheme: DrawerThemeData(
  //     backgroundColor: Colors.grey.shade800,
  //     elevation: 0,
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ButtonStyle(
  //       textStyle: WidgetStateProperty.all(
  //         TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
  //       ),
  //       backgroundColor: WidgetStateProperty.all(Colors.green.shade500),
  //       foregroundColor: WidgetStateProperty.all(Colors.black),

  //       minimumSize: WidgetStateProperty.all(Size.fromHeight(50)),
  //       shape: WidgetStateProperty.all(
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       ),
  //     ),
  //   ),

  //   inputDecorationTheme: InputDecorationTheme(
  //     filled: true,
  //     isDense: true,
  //     fillColor: AppColors.black1,
  //     prefixIconColor: AppColors.red.withValues(alpha: 0.048),
  //     hintStyle: TextStyle(color: AppColors.grey1),
  //   ),
  // );
}

class ThemeProvider extends GetxController {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  ThemeProvider() {
    _loadThemeFromPrefs();
  }

  Future<void> _loadThemeFromPrefs() async {
    final isDark = AppPref().getBool(PrefKey.isDarkTheme);
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final isDark = _themeMode == ThemeMode.dark;
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;

    AppPref().setBool(PrefKey.isDarkTheme, !isDark);
  }

  void setTheme(ThemeMode mode) {
    _themeMode = mode;
    AppPref().setBool(PrefKey.isDarkTheme, mode == ThemeMode.dark);
  }
}
