import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';

import 'item_drinks_details.dart';

class ItemDrinks extends StatefulWidget {
  final ProductDrinks drink;
  ItemDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemDrinksState createState() => _ItemDrinksState();
}

class _ItemDrinksState extends State<ItemDrinks> {
  var x = Icons.favorite;
  Color setColor(){
      if (widget.drink.liked == false) {
          return Colors.white;
        } else {
          return Colors.green;
        }
    }
  @override
  Widget build(BuildContext context) {
    //return Container(child: Text("${widget.drink.productTitle}"));
    _liked() {
    Color color_x;
        if (widget.drink.liked == false) {
          color_x = setColor();
          widget.drink.liked = true;
        } else {
          color_x = setColor();
          widget.drink.liked = false;
        }
    }

    void _openDrinksDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ItemDrinksDetails(
              drink: widget.drink,
            );
          },
        ),
      );
    }

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          height: 210,
          width: double.maxFinite,
          child: GestureDetector(
            onTap: _openDrinksDetails,
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.all(8.0),
              color: Theme.of(context).cardColor,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              "${widget.drink.productTitle}",
                              style: Theme.of(context).textTheme.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            child: Text(
                              "💲"
                              "${widget.drink.productPrice}",
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      child: Image.network(
                        "${widget.drink.productImage}",
                        fit: BoxFit.fitHeight,
                        height: 180,
                      ),
                    ),
                    flex: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 150),
                    child: IconButton(
                        icon: Icon(x, color: setColor()),
                        onPressed: () {
                          setState(() {
                            _liked();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
