import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/payment.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemDrinksDetails extends StatefulWidget {
  final ProductDrinks drink;

  ItemDrinksDetails({Key key, this.drink}) : super(key: key);

  @override
  _ItemDrinksDetailsState createState() => _ItemDrinksDetailsState();
}

class _ItemDrinksDetailsState extends State<ItemDrinksDetails> {
  @override
  var x = Icons.favorite;
  double price = 120;

  Widget build(BuildContext context) {
    _liked() {
      if (widget.drink.liked == true) {
        return Colors.green;
      } else
        return Colors.white;
    }
    void addCarrito(){
      if(!listaencarrito.contains(widget.drink.productTitle)){
        ProductItemCart x = new ProductItemCart(
          productTitle: widget.drink.productTitle, 
          productAmount: widget.drink.productAmount, 
          productPrice: widget.drink.productPrice, 
          productImage: widget.drink.productImage,
          productliked: widget.drink.liked,
        );
        listacarrito.add(x);
        listaencarrito.add(widget.drink.productTitle);

      }
    }
    
    return Scaffold(
      appBar: AppBar(title: Text("${widget.drink.productTitle}")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Backgroud_Color_Image,
            margin: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(38, 0, 0, 0),
                  child: Image.network(
                    "${widget.drink.productImage}",
                    width: 280,
                    height: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 200),
                  child: Icon(
                    x,
                    color: _liked(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  "${widget.drink.productTitle}",
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).textSelectionColor,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 150, 10),
            child: Text(
              "${widget.drink.productDescription}",
              style: TextStyle(fontSize: 18, fontFamily: "AkzidenzGrotesk"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
            child: Row(
              children: <Widget>[
                Text(
                  "Tamaños disponibles:  ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.monetization_on,
                  size: 30,
                ),
                Text(
                  "${widget.drink.productPrice}",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ActionChip(
                label: Text('CHICO'),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.CH;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
              ),
              ActionChip(
                label: Text('MEDIANO'),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.M;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
              ),
              ActionChip(
                label: Text('GRANDE'),
                onPressed: () {
                  setState(() {
                    widget.drink.productSize = ProductSize.G;
                    widget.drink.productPrice =
                        widget.drink.productPriceCalculator();
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "AGREGAR A CARRITO",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {
                    addCarrito();
                  },
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "COMPRAR AHORA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=>Payment(),
                      )
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
