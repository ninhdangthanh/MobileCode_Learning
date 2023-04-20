import 'package:flutter/material.dart';
import 'package:local_event_app/model/category.dart';
import 'package:local_event_app/styleguide.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if(!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3),
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
