import 'package:flutter/material.dart';
import 'package:foodapp_mobile/category_item.dart';
import 'package:foodapp_mobile/fake_data.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = '/CategoriesPage';
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 4/2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12
        ),
        children: FAKE_CATEGORIES.map((e) => CategoryItem(category: e)).toList(),
      ),
    );
  }
  
}