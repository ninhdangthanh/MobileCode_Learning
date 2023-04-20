import 'package:flutter/material.dart';

import '../../model/category.dart';
import '../../styleguide.dart';


class CategoryWidget extends StatelessWidget {
  final Category category;
  final int selectedCategoryId;
  final Function(int) onChangeId;

  const CategoryWidget({super.key, required this.category, required this.selectedCategoryId, required this.onChangeId});

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if(!isSelected) {
          onChangeId(category.categoryId);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: isSelected ? Colors.white : Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
              size: 40,
            ),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
