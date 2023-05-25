import 'package:flutter/material.dart';
import 'package:new_app/Auth/forgot_password.dart';
import 'package:new_app/Auth/login_page.dart';
import 'package:new_app/Auth/not_you.dart';
import 'package:new_app/Auth/register.dart';
import 'package:new_app/Colors/app_colors.dart';
import 'package:new_app/Screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: primaryColor),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "login": (context) => const LoginPage(),
        "forgot_password": (context) => const ForgotPassword(),
        "not_you": (context) => const NotYouPage(),
        "register": (context) => const RegisterPage(),
      },
    );
  }
}
