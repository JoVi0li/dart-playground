import '../interfaces/icart.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';
import '../observers/cart_observer.dart';

class CartController extends CartObserver implements ICart {
  CartController(this.cart);

  final CartModel cart;

  @override
  void addProduct(ProductModel product) {
    if (!cart.products.contains(product)) {
      cart.products.add(product);

      if (cart.client != null) {
        notify(cart.client!);
      } else {
        notifyAll();
      }
    }
  }

  @override
  List<ProductModel> getAllProduct() {
    return cart.products;
  }

  @override
  ProductModel getProduct(int id) {
    return cart.products.firstWhere(
      (element) => element.id == id,
    );
  }

  @override
  void removeAllProduct() {
    cart.products = <ProductModel>[];
    if (cart.client != null) {
      notify(cart.client!);
    } else {
      notifyAll();
    }
  }

  @override
  void removeProduct(ProductModel product) {
    if (cart.products.contains(product)) {
      cart.products.remove(product);

      if (cart.client != null) {
        notify(cart.client!);
      } else {
        notifyAll();
      }
    }
  }
}
