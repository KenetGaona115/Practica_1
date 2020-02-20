import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/cart/payment.dart';
import 'package:practica_integradora_uno/home/home.dart';
import 'package:practica_integradora_uno/utils/constants.dart';

import 'home/home.dart';
import 'home/home.dart';
import 'login/inicio.dart';
import 'login/inicio.dart';
import 'login/inicio.dart';
import 'login/login.dart';
import 'login/login.dart';
import 'login/registro.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';
import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primarySwatch: PRIMARY_COLOR,
        backgroundColor: PRIMARY_COLOR,
        buttonColor: Button_Color,
        textSelectionColor: Font_Color,
        cardColor: Card_Descp_Color,
        
      ),
      home: Inicio(),
    );
  }
}
