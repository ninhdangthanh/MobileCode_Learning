import 'dart:math';

import './category.dart';
import 'package:flutter/cupertino.dart';

class Food{
  int id = Random().nextInt(1000);
  String name;
  String urlImage;
  Duration duration;
  Complexity? complexity;

  List<String>? ingredients = <String>[];
  int? categoryId;

  Food({
    required this.name,
    required this.urlImage,
    required this.duration,
    this.complexity,
    this.ingredients,
    this.categoryId,
  });
}

enum Complexity{
  Simple,
  Medium,
  Hard
}