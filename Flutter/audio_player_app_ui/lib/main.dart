import 'package:flutter/material.dart';
import 'my_home_page.dart';
import './audio/app_colors.dart' as AppColors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio Reading',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.background,
      ),
      home: MyHomePage()
    );
  }
}
