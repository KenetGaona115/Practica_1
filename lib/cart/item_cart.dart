import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(24),
      color: Backgroud_Color_Image,
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 12,
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,0,0,0),
                    child: Text(
                      "${widget.product.productTitle}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100,0,0,0),
                    child: Icon(
                      Icons.favorite,
                      color: _liked(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "${widget.product.productImage}",
                  height: 150,
                  width: 150,
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: _addProd),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "${widget.product.productAmount}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.remove_circle), onPressed: _remProd),
                  SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Icon(
                    Icons.monetization_on,
                    size: 30,
                  ),
                  Text(
                    "${widget.product.productPrice}",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(110,0,0,0),
                    child: IconButton(
                     icon: Icon(Icons.restore_from_trash),
                      onPressed: (){
                        _remove();
                      }
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    if (widget.product.productAmount > 0) {
      setState(() {
        --widget.product.productAmount;
      });
      widget.onAmountUpdated(-1 * widget.product.productPrice);
    }
  }

  void _remove(){
    listacarrito.remove(widget.product);
    listaencarrito.remove(widget.product.productTitle);
    setState(() {
      widget.onAmountUpdated(-1 * widget.product.productAmount * widget.product.productPrice);
    });
  }

 Color _liked() {
      if (widget.product.productliked == true) {
        return Colors.green;
      } else
        return Colors.white;
    }

}
