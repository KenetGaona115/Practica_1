import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/drinks/item_drinks.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

class DrinksPage extends StatelessWidget {
  final List<ProductDrinks> drinksList;
  DrinksPage({
    Key key,
    @required this.drinksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemDrinks(
            drink: drinksList[index],
          );
        },
      ),
    );
  }
}
