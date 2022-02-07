import 'dart:math';

import '../interfaces/iclient.dart';
import 'product_model.dart';

class CartModel {
  CartModel({required this.client});

  final int id = Random().nextInt(100);
  double total = 0;
  int quantity = 0;
  IClient? client;
  List<ProductModel> products = <ProductModel>[];

 
}
