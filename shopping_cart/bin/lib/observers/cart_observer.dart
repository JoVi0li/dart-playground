import '../interfaces/icart_observer.dart';
import '../interfaces/iclient.dart';

class CartObserver implements ICartObserver {
  List<IClient> subscribers = <IClient>[];

  @override
  void notify(IClient client) {
    if (subscribers.contains(client)) {
      client.update();
    }
  }

  @override
  void notifyAll() {
    for (IClient client in subscribers) {
      client.update();
    }
  }

  @override
  void subscribe(IClient client) {
    if (!subscribers.contains(client)) {
      subscribers.add(client);
    }
  }

  @override
  void unsbscribeAll() {
    subscribers = <IClient>[];
  }

  @override
  void unsubscribe(IClient client) {
    if (subscribers.contains(client)) {
      subscribers.remove(client);
    }
  }
}
