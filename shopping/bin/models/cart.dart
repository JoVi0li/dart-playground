import 'dart:math';

import '../interfaces/iclient.dart';
import 'product.dart';

class Cart {
  final int id = Random().nextInt(100);
  double value = 0;
  int quantity = 0;
  List<Product> cart = <Product>[];
  IClient client;
  Cart({
    required this.client,
  });
}
