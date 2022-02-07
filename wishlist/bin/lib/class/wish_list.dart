import '../interface/product_interface.dart';
import '../interface/wish_list_interface.dart';

class WishList implements IWishList {
  List<IProduct> subscribes = <IProduct>[];

  @override
  void notifyAll() {
    for (IProduct item in subscribes) {
      item.update();
    }
  }

  @override
  void notify(IProduct product) {
    if (subscribes.contains(product)) {
      product.update();
    }
  }

  @override
  void subscribe(IProduct product) {
    if (!subscribes.contains(product)) {
      subscribes.add(product);
    }
  }

  @override
  void unsubscribe(IProduct product) {
    if (subscribes.contains(product)) {
      subscribes.remove(product);
    }
  }

  @override
  void unsubscribeAll() {
    subscribes = <IProduct>[];
  }
}
