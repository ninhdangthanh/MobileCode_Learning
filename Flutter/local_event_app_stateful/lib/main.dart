import 'package:flutter/material.dart';
import 'package:local_event_app_stateful/ui/homepage/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Clone from AppState to StateFulWidget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          primaryColor: Colors.pinkAccent
      ),
      home: HomePage(),
    );
  }

}
