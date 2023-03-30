import 'package:flutter/cupertino.dart';

class Car {
  String name;
  int yearOfProduction;
  //this is constructor
  Car({
    required this.name, // @required = Not Null
    this.yearOfProduction = 2020
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $yearOfProduction \n';
  }

  void _doSomeThing() {
    print("I am do something.......");
  }

  void sayHello({required String personName}) {
    print('Hello $personName !');
    _doSomeThing();
  }
}