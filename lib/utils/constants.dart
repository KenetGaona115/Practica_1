import 'package:flutter/material.dart';
import 'package:practica_integradora_uno/models/product_cup.dart';
import 'package:practica_integradora_uno/models/product_drinks.dart';
import 'package:practica_integradora_uno/models/product_grains.dart';
import 'package:practica_integradora_uno/models/product_item_cart.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

// home
const String APP_TITLE = "Coffe shop";
// profile
const String PROFILE_TITLE = "Perfil";
const String PROFILE_LOGOUT = "Cerrar sesion";
const String PROFILE_CART = "Lista de compras";
const String PROFILE_WISHES = "Lista de deseos";
const String PROFILE_HISTORY = "Historial de compras";
const String PROFILE_SETTINGS = "Ajustes";
const String PROFILE_NAME = "Anna Doe";
const String PROFILE_EMAIL = "anna@doe.com";
const String PROFILE_PICTURE = "https://scontent.fgdl5-1.fna.fbcdn.net/v/t1.0-9/968952_10151584714793926_926873313_n.jpg?_nc_cat=109&_nc_ohc=lyz3bk_frrgAX-7daD6&_nc_ht=scontent.fgdl5-1.fna&oh=c249a03aafba39ab6c22cce7f0c7b208&oe=5EB982C3";

List<ProductDrinks> listaBebidas =ProductRepository.loadProducts(ProductType.BEBIDAS);
List<ProductCup> listaTazas = ProductRepository.loadProducts(ProductType.TAZAS);
List<ProductGrains> listaGranos = ProductRepository.loadProducts(ProductType.GRANO);

List<ProductItemCart> listacarrito = new List<ProductItemCart>();
List<String> listaencarrito = new List<String>();
// app

const MaterialColor PRIMARY_COLOR = const MaterialColor(
  0xFF214254,
  const <int, Color>{
    50: const Color(0xFF214254),
    100: const Color(0xFF214254),
    200: const Color(0xFF214254),
    300: const Color(0xFF214254),
    400: const Color(0xFF214254),
    500: const Color(0xFF214254),
    600: const Color(0xFF214254),
    700: const Color(0xFF214254),
    800: const Color(0xFF214254),
    900: const Color(0xFF214254),
  },
);

const MaterialColor Button_Color = const MaterialColor(
  0xFF8B8175,
  const <int, Color>{
    50: const Color(0xFF8B8175),
    100: const Color(0xFF8B8175),
    200: const Color(0xFF8B8175),
    300: const Color(0xFF8B8175),
    400: const Color(0xFF8B8175),
    500: const Color(0xFF8B8175),
    600: const Color(0xFF8B8175),
    700: const Color(0xFF8B8175),
    800: const Color(0xFF8B8175),
    900: const Color(0xFF8B8175),
  },
);


const MaterialColor Backgroud_Color_Image = const MaterialColor(
  0xFFFABF7C,
  const <int, Color>{
    50: const Color(0xFFFABF7C),
    100: const Color(0xFFFABF7C),
    200: const Color(0xFFFABF7C),
    300: const Color(0xFFFABF7C),
    400: const Color(0xFFFABF7C),
    500: const Color(0xFFFABF7C),
    600: const Color(0xFFFABF7C),
    700: const Color(0xFFFABF7C),
    800: const Color(0xFFFABF7C),
    900: const Color(0xFFFABF7C),
  },
);

const MaterialColor Font_Color = const MaterialColor(
  0xFF121B22,
  const <int, Color>{
    50: const Color(0xFF121B22),
    100: const Color(0xFF121B22),
    200: const Color(0xFF121B22),
    300: const Color(0xFF121B22),
    400: const Color(0xFF121B22),
    500: const Color(0xFF121B22),
    600: const Color(0xFF121B22),
    700: const Color(0xFF121B22),
    800: const Color(0xFF121B22),
    900: const Color(0xFF121B22),
  },
);

const MaterialColor Card_Descp_Color = const MaterialColor(
  0xFFBCB0A1,
  const <int, Color>{
    50: const Color(0xFFBCB0A1),
    100: const Color(0xFFBCB0A1),
    200: const Color(0xFFBCB0A1),
    300: const Color(0xFFBCB0A1),
    400: const Color(0xFFBCB0A1),
    500: const Color(0xFFBCB0A1),
    600: const Color(0xFFBCB0A1),
    700: const Color(0xFFBCB0A1),
    800: const Color(0xFFBCB0A1),
    900: const Color(0xFFBCB0A1),
  },
);

