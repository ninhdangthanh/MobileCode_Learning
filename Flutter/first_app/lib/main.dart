import 'package:flutter/material.dart';
import './calculation.dart';
import 'MyAppWidget.dart';
import 'car.dart';

void main() {

  runApp(
      MaterialApp(
        title: "Transaction app",
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        home: MyAppWidget(),
      )
  );
}

