import 'product_interface.dart';

abstract class IWishList {

  /// Adiciona um novo ouvinte
  void subscribe(IProduct product);

  /// Remove um ouvinte
  void unsubscribe(IProduct product);

  /// Remove todos os ouvintes
  void unsubscribeAll();

  /// Notifica um ouvinte
  void notify(IProduct product);

  /// Notifica todos os ouvintes
  void notifyAll();

}
