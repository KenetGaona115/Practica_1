import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/home/home.dart';

import '../utils/constants.dart';
import 'inicio.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final name = TextEditingController();
    
    _navigateTo() {
      if (validate_User(name.text, password.text) == true) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> Home(title: APP_TITLE,)
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 50),
                  child: Image.asset(
                    "assets/cupping.png",
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  "Nombre completo:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Container(
              width: 370.0,
              height: 50,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'John Doe'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Row(
              children: <Widget>[
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 370.0,
            height: 50,
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                filled: false,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  height: 50.0,
                  minWidth: 368.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "ENTRAR",
                    style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18,
                      fontFamily: "AkzidenzGrotesk",
                    ),
                  ),
                  onPressed: () {
                    _navigateTo();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Text(
                    "¿olvisate tu password?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "¿Aun no tienes cuenta?",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "REGISTRATE",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//funcion de validacion
bool validate_User(String user, String password) {
  if (user == PROFILE_NAME && password == "123") 
    return true;

  return false;
}
