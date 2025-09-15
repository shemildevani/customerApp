import 'package:customer_app/config/theme/theme.dart';
import 'package:customer_app/preferences/app_preferences.dart';
import 'package:customer_app/screens/auth/login/login_screen.dart';
import 'package:customer_app/screens/no_network_screen.dart/no_netwrok_screen_cnt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPref().initialAppPreference();
  Get.put(NoInternetConnectionScreenCnt(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    );
  }
}
