import '../models/product_model.dart';

abstract class ICart {
  void addProduct(ProductModel produto);

  ProductModel getProduct(int id);

  List<ProductModel> getAllProduct();

  void removeProduct(ProductModel product);

  void removeAllProduct();
}
