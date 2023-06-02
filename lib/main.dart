import 'package:flutter/material.dart';
import 'package:new_app/Providers/auth_provider.dart';
import 'package:new_app/app.dart';
import 'package:new_app/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordVisibility(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}
