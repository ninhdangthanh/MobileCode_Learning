import 'package:flutter/material.dart';
import 'package:foodapp_mobile/categories_page.dart';
import './foods_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: "/",
      routes: {
        'FoodsPage' : (context) => FoodsPage(),
        'CategoriesPage': (context) => CategoriesPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'Tillana'
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Food's Category", style: TextStyle(fontWeight: FontWeight.bold,),),
        ),
        body: SafeArea(child: CategoriesPage(),)
      )
    );
  }
}
