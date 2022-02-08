import 'iclient.dart';

abstract class ICartObserver {
  void subscribe(IClient client);

  void unsubscribe(IClient client);

  void unsubscribeById(int id);

  void notify(IClient client, dynamic value);

  void notifyById(IClient client, dynamic value);

  void notifyAll(dynamic value);
}
