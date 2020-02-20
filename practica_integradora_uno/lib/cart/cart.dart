import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/item_cart.dart';
import 'package:practica_integradora_uno/cart/payment.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Lista de compras")
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemCart(
                  onAmountUpdated: _priceUpdate,
                  product: widget.productsList[index],
                );
              },
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                "Total: \$$_total",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: 350,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                color: Theme.of(context).buttonColor,
                child: Text(
                  "PAGAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "AkzidenzGrotesk",
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Payment()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
