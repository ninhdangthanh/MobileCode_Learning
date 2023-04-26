import 'package:flutter/material.dart';
import 'MyAppWidget.dart';

void main() {
  runApp(MaterialApp(
    title: "Transaction app",
    theme: ThemeData(primaryColor: Colors.pink),
    debugShowCheckedModeBanner: false,
    home: MyAppWidget(),
  ));
}
