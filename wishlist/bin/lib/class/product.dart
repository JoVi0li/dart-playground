import '../interface/product_interface.dart';

class Product implements IProduct {
  const Product(this.id);

  final int id;

  @override
  void update() {
    print('Produto com o id $id atualizado');
  }
}
