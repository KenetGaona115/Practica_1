import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cup/item_cup.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

class CupPage extends StatelessWidget {
  final List<ProductCup> cupList;
  CupPage({
    Key key,
    @required this.cupList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tazas"),
      ),
      body: ListView.builder(
        itemCount: cupList.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemCup(
            cup: cupList[index],
          );
        },
      ),
    );
  }
}
