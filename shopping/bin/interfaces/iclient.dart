import 'dart:math';

abstract class IClient {
  final int id = Random().nextInt(100);
  void update(dynamic value);
}
