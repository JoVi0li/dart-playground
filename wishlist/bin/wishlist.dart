import 'lib/class/product.dart';
import 'lib/class/wish_list.dart';
import 'lib/interface/product_interface.dart';

void main() {
  const IProduct productOne = Product(1);
  const IProduct productTwo = Product(2);
  const IProduct productThree = Product(3);

  final WishList wishList = WishList();

  print(wishList.subscribes);

  wishList.subscribe(productOne);
  wishList.subscribe(productTwo);
  wishList.subscribe(productThree);

  print(wishList.subscribes);

  wishList.notifyAll();

  wishList.unsubscribe(productTwo);

  print(wishList.subscribes);

  wishList.notifyAll();

  wishList.notify(productTwo);
}
