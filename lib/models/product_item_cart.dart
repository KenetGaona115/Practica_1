import 'package:flutter/foundation.dart';
import 'package:practica_integradora_uno/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  final ProductType typeOfProduct;
  String productImage;
  bool productliked;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    @required this.productImage,
    @required this.productliked,
  });
}