import 'package:flutter/material.dart';
import 'package:new_app/app.dart';
import 'package:new_app/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Change(),)
      ],
      child: const MyApp(),
    ),
  );
}
