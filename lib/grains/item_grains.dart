import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/grains/item_grains_details.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;
  ItemGrains({
    Key key,
    @required this.grains,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
  var x = Icons.favorite;
  Color setColor(){
      if (widget.grains.liked == false) {
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
        if (widget.grains.liked == false) {
          x = Icons.favorite;
          color_x = setColor();
          widget.grains.liked = true;
        } else {
          color_x = setColor();
          x = Icons.favorite_border;
          widget.grains.liked = false;
        }
    }

    void _openGrainsDetails() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ItemGrainsDetails(
              grains: widget.grains,
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
            onTap: _openGrainsDetails,
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
                              "${widget.grains.productTitle}",
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
                              "${widget.grains.productPrice}",
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
                        "${widget.grains.productImage}",
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
