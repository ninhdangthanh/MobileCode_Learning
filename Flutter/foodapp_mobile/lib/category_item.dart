import 'package:flutter/material.dart';

import 'foods_page.dart';
import 'models/category.dart';

class CategoryItem extends StatelessWidget {
  // 1 category item - 1 category object

  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    Color? _color = category.color;
    return InkWell(
      onTap: () {
        print('tap to category' + this.category.content);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //       builder: (context) => FoodsPage(category: this.category)
        //   )
        // );

        Navigator.pushNamed(context, FoodsPage.routeName, arguments: {'category': category});

      },
      splashColor: Colors.deepPurple,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  _color!.withOpacity(0.8),
                  _color
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft
            ),
            color: _color,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(category.content, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}