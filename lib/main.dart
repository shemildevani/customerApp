import 'package:customer_app/config/theme/theme.dart';
import 'package:customer_app/preferences/app_preferences.dart';
import 'package:customer_app/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await AppPref().initialAppPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      home: LoginScreen(),
    ); 
  }
}
