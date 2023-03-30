import 'package:flutter/material.dart';
import 'package:foodapp_mobile/fake_data.dart';

import 'models/category.dart';
import 'models/food.dart';
import './detail_food_page.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = 'FoodsPage';
  Category? category;

  FoodsPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category>? arguments = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, Category>?;
    this.category = arguments!['category'];
    List<Food> foods = FAKE_FOODS.where((food) =>
    food.categoryId == this.category?.id).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("Food from category " + category!.content),
        ),
        body: Center(
          child: Center(
              child: foods.length > 0 ? ListView.builder(
                  itemCount: foods.length,
                  itemBuilder: (context, index) {
                    Food food = foods[index];
                    return InkWell(
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              clipBehavior: Clip.hardEdge,
                              child: Center(
                                child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/loading.gif',
                                    image: food.urlImage),
                              ),
                            ),
                          ),
                          Positioned(top: 30, left: 30,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white, width: 2)
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.timer, color: Colors.white,
                                    size: 25,),
                                  Text('${food.duration.inMinutes} minutes',
                                    style: const TextStyle(
                                        fontSize: 22, color: Colors.white),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => DetailFoodPage(food: food)
                            )
                        );
                      },
                    );
                  }
              ) :
                  Text('No food found', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
          ),
        )
    );
  }
}