import 'dart:ui';

import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    _dialog() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: <Widget>[
              Image.network(
                  "https://as.com/deporteyvida/imagenes/2018/11/30/portada/1543604759_559830_1543604909_noticia_normal.jpg"),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/originals/66/53/09/665309d7adb8a7d1a57da97b68a2a163.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "¡Orden Exitosa!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50,0,0,0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Taza cuping",
                      style: TextStyle(
                        fontSize: 15
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,10,0,0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Tu orden ha sido registrada, para más información busca en la opcion historial de compras en tu perfil.",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              new FlatButton(
                child: new Text(
                  "Aceptar",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    //Body 
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pagos")),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Center(
              child: Text(
                "Elige tu metodo de pago:",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: _dialog,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      color: Theme.of(context).cardColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Image.network(
                                  "https://images.vexels.com/media/users/3/129923/isolated/preview/23c69d5178087b811dd1196cf6274613-icono-de-tarjetas-de-credito-by-vexels.png",
                                  height: 100,
                                ),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Text(
                              "Tarjeta de credito",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 90, 10, 0),
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _dialog,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      color: Theme.of(context).cardColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Image.network(
                                  "https://pluspng.com/img-png/paypal-png-paypalnew123-png-1686.png",
                                  height: 100,
                                ),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Text(
                              "PayPal",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 90, 10, 0),
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _dialog,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                      color: Theme.of(context).cardColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Image.network(
                                  "https://cdn.iconscout.com/icon/premium/png-256-thumb/gift-card-9-619465.png",
                                  height: 100,
                                ),
                              ),
                            ),
                            flex: 2,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                            child: Text(
                              "Tarjeta de regalo",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 90, 10, 0),
                            child: Icon(Icons.edit),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
