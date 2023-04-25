import 'package:flutter/material.dart';

class CategoriesSelector extends StatefulWidget {
  const CategoriesSelector({Key? key}) : super(key: key);

  @override
  State<CategoriesSelector> createState() => _CategoriesSelectorState();
}

class _CategoriesSelectorState extends State<CategoriesSelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(itemCount: categories.length,
      scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: Text(
                categories[index],
                style: TextStyle(
                  fontSize: 28.0,
                  color:
                  index == selectedIndex ? Color(0x55CFD8DC) : Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

