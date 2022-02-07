import 'iclient.dart';

abstract class ICartObserver {
  void subscribe(IClient cliente);

  void unsubscribe(IClient cliente);

  void unsbscribeAll();

  void notify(IClient cliente);

  void notifyAll();
}
