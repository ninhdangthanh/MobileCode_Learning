import 'package:first_app_bloc/bloc/my_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MyAppWidget.dart';

void main() {
  runApp(MaterialApp(
    title: "Transaction app",
    theme: ThemeData(primaryColor: Colors.pink),
    debugShowCheckedModeBanner: false,
    home: BlocProvider(
      create: (context) => MyBloc(),
      child: MyAppWidget(),
    ),
  ));
}
