import '../interfaces/icart.dart';
import '../models/cart.dart';
import '../models/product.dart';
import '../observers/cartobserver.dart';

class CartController extends CartObserver implements ICart {
  CartController({
    required this.cart,
  });

  Cart cart;

  @override
  void addProduct(Product product) {
    if (cart.cart.contains(product)) {
      cart.cart.add(product);
      notify(
        cart.client,
        "Um novo produto foi adicionado ao seu carrinho",
      );
    }
  }

  @override
  List<Product> getAllProduct() {
    return cart.cart;
  }

  @override
  Product getProduct(Product product) {
    Product prod = cart.cart.firstWhere(
      (element) => element == product,
    );

    return prod;
  }

  @override
  Product getProductById(int id) {
    Product prod = cart.cart.firstWhere(
      (element) => element.id == id,
    );

    return prod;
  }

  @override
  int getTotalQuantity() {
    return cart.cart.length;
  }

  @override
  double getTotalValue() {
    double total = 0;
    for (Product prod in cart.cart) {
      total = total + prod.price;
    }
    return total;
  }

  @override
  void removeAllProduct() {
    cart.cart = <Product>[];
    notifyAll('O carrinho foi esvaziado!');
  }

  @override
  void removeProduct(Product product) {
    cart.cart.remove(product);
    notify(cart.client, "O produto foi removido do seu carrinho");
  }

  @override
  void removeProductById(int id) {
    Product prod = cart.cart.firstWhere((element) => element.id == id);

    if (cart.cart.contains(prod)) {
      cart.cart.remove(prod);
      notify(cart.client, 'O produto foi removido do seu carrinho');
    }
  }
}
