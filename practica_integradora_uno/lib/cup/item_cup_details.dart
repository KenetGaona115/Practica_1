import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/payment.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCupDetails extends StatefulWidget {
  final ProductCup cup;

  ItemCupDetails({Key key, this.cup}) : super(key: key);

  @override
  _ItemCupDetailsState createState() => _ItemCupDetailsState();
}

class _ItemCupDetailsState extends State<ItemCupDetails> {
  @override
  var x = Icons.favorite;
  
  Widget build(BuildContext context) {
    _liked() {
      if (widget.cup.liked == true) {
        return Colors.green;
      } else
        return Colors.white;
    }

    void addCarrito(){
      if(!listaencarrito.contains(widget.cup.productTitle)){
        ProductItemCart x = new ProductItemCart(
          productTitle: widget.cup.productTitle, 
          productAmount: widget.cup.productAmount, 
          productPrice: widget.cup.productPrice, 
          productImage: widget.cup.productImage,
          productliked: widget.cup.liked,
        );
        listacarrito.add(x);
        listaencarrito.add(widget.cup.productTitle);

      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("${widget.cup.productTitle}")),
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
                    "${widget.cup.productImage}",
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
                  "${widget.cup.productTitle}",
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
              "${widget.cup.productDescription}",
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
                  "${widget.cup.productPrice}",
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
              MaterialButton(
                color: Colors.white,
                minWidth: 40,
                height: 40,
                onPressed: () {
                  setState(() {
                    widget.cup.productColor = ProductColor.Black;
                    widget.cup.productPrice =
                        widget.cup.productPriceCalculator();
                  });
                },
              ),
              MaterialButton(
                color: Colors.blue,
                minWidth: 40,
                height: 40,
                onPressed: () {
                  setState(() {
                   widget.cup.productColor = ProductColor.Blue;
                    widget.cup.productPrice =
                        widget.cup.productPriceCalculator();
                  });
                },
              ),
              MaterialButton(
                color: Colors.black,
                minWidth: 40,
                height: 40,
                onPressed: () {
                  setState(() {
                   widget.cup.productColor = ProductColor.White;
                    widget.cup.productPrice =
                        widget.cup.productPriceCalculator();
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
