import 'package:flutter/material.dart';
import 'package:foodapp_mobile/models/food.dart';

class DetailFoodPage extends StatelessWidget {

  Food food;

  DetailFoodPage({required this.food});

  @override
  Widget build(BuildContext context) {
    print('ingredients : ${food.ingredients}');

    return Scaffold(
      appBar: AppBar(title: Text(food.name)),
      body: Column(
        children: [
          Center(
            child: FadeInImage.assetNetwork(placeholder: 'assets/images/loading.gif', image: food.urlImage),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Text('Ingredients: ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: food.ingredients?.length != null ? ListView.builder(
              itemCount: food.ingredients?.length,
              itemBuilder: (context, index) {
                String ingredient = food.ingredients![index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('#${index + 1}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                  title: Text(ingredient, style: const TextStyle(fontSize: 20),),
                );
              },
            ) :
            Text("No Ingredients", style: const TextStyle(fontSize: 20))
          )
        ],
      )
    );
  }

}