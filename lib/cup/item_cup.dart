import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';

import 'item_cup_details.dart';

class ItemCup extends StatefulWidget {
  final ProductCup cup;
  ItemCup({
    Key key,
    @required this.cup,
  }) : super(key: key);

  @override
  _ItemCupState createState() => _ItemCupState();
}

class _ItemCupState extends State<ItemCup> {
  var x = Icons.favorite;
  Color setColor(){
      if (widget.cup.liked == false) {
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
        if (widget.cup.liked == false) {
          x = Icons.favorite;
          color_x = setColor();
          widget.cup.liked = true;
        } else {
          color_x = setColor();
          x = Icons.favorite_border;
          widget.cup.liked = false;
        }
    }
    void _openCupDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ItemCupDetails(
              cup: widget.cup,
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
            onTap: _openCupDetails,
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
                              "${widget.cup.productTitle}",
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
                            child: Text("💲"
                              "${widget.cup.productPrice}",
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
                        "${widget.cup.productImage}",
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
