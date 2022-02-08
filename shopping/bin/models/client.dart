import 'dart:math';

import '../interfaces/iclient.dart';

class Client implements IClient {
  @override
  final int id = Random().nextInt(100);

  final String name;

  Client(this.name);

  @override
  void update(value) {
    print("Cliente: $name \n Atualização: $value");
  }
}
