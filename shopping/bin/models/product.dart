import 'dart:math';

class Product {
  final int id = Random().nextInt(100);
  final double price = Random().nextDouble();
  final String name;

  Product(this.name);
}
