import '../interfaces/icartobserver.dart';
import '../interfaces/iclient.dart';

class CartObserver implements ICartObserver {
  final List<IClient> _subscribers = <IClient>[];

  List<IClient> get subscribers => _subscribers;

  @override
  void notify(IClient client, value) {
    if (_subscribers.contains(client)) {
      client.update(value);
    }
  }

  @override
  void notifyAll(value) {
    for (IClient client in _subscribers) {
      client.update(value);
    }
  }

  @override
  void notifyById(IClient client, value) {
    IClient costumer = _subscribers.firstWhere(
      (element) => element.id == client.id,
    );

    if (_subscribers.contains(costumer)) {
      costumer.update(value);
    }
  }

  @override
  void subscribe(IClient client) {
    if (!_subscribers.contains(client)) {
      _subscribers.add(client);
    }
  }

  @override
  void unsubscribe(IClient client) {
    if (_subscribers.contains(client)) {
      _subscribers.remove(client);
    }
  }

  @override
  void unsubscribeById(int id) {
    IClient costumer = _subscribers.firstWhere(
      (element) => element.id == id,
    );

    if (_subscribers.contains(costumer)) {
      _subscribers.remove(costumer);
    }
  }
}
