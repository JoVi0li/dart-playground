import '../models/product.dart';

abstract class ICart {
  void addProduct(Product product);

  Product getProduct(Product product);

  Product getProductById(int id);

  List<Product> getAllProduct();

  void removeProductById(int id);

  void removeProduct(Product product);

  void removeAllProduct();

  double getTotalValue();

  int getTotalQuantity();
}
