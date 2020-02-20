import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/constants.dart';
import 'login.dart';
import 'registro.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _navigateToLogin(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>Login())
    );
  }
  _navigateToRegistro(){
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context)=>Registro())
    );
  }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 130),
                  child: Image.asset(
                    "assets/cupping.png",
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: MaterialButton(
              child: Text(
                "REGISTRATE",
                style: TextStyle(
                  color: Theme.of(context).textSelectionColor,
                ),
              ),
              height: 40,
              minWidth: 350,
              color: Theme.of(context).buttonColor,
              onPressed: () {
                _navigateToRegistro();
              },
            ),
          ),
          MaterialButton(
            child: Text(
              "INGRESA",
              style: TextStyle(
                color: Theme.of(context).textSelectionColor,
              ),
            ),
            height: 40,
            minWidth: 350,
            color: Theme.of(context).buttonColor,
            onPressed: () {
              _navigateToLogin();
            },
          ),
        ],
      ),
    );
  }
}
