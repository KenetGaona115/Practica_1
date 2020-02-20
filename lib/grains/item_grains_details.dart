import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/payment.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemGrainsDetails extends StatefulWidget {
  final ProductGrains grains;

  ItemGrainsDetails({Key key, this.grains}) : super(key: key);

  @override
  _ItemGrainsDetailsState createState() => _ItemGrainsDetailsState();
}

class _ItemGrainsDetailsState extends State<ItemGrainsDetails> {
  @override
  var x = Icons.favorite;
  Widget build(BuildContext context) {
    _liked() {
      if (widget.grains.liked == true) {
        return Colors.green;
      } else
        return Colors.white;
    }
    void addCarrito(){
      if(!listaencarrito.contains(widget.grains.productTitle)){
        ProductItemCart x = new ProductItemCart(
          productTitle: widget.grains.productTitle, 
          productAmount: widget.grains.productAmount, 
          productPrice: widget.grains.productPrice, 
          productImage: widget.grains.productImage,
          productliked: widget.grains.liked,
        );
        listacarrito.add(x);
        listaencarrito.add(widget.grains.productTitle);

      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("${widget.grains.productTitle}")),
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
                    "${widget.grains.productImage}",
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
                  "${widget.grains.productTitle}",
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
              "${widget.grains.productDescription}",
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
                  "${widget.grains.productPrice}",
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
                label: Text('Cuarto'),
                onPressed: () {
                  setState(() {
                    widget.grains.productWeight = ProductWeight.CUARTO;
                    widget.grains.productPrice =
                        widget.grains.productPriceCalculator();
                  });
                },
              ),
              ActionChip(
                label: Text('Kilo'),
                onPressed: () {
                  setState(() {
                    widget.grains.productWeight = ProductWeight.KILO;
                    widget.grains.productPrice =
                        widget.grains.productPriceCalculator();
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
