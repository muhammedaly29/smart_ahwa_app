import 'package:smart_ahwa_manager_app/models/drink.dart';

class Order {
  final String _customerName;
  final Drink _drink;
  final String _instructions;
  bool _isCompleted = false;

  Order(this._customerName, this._drink, this._instructions);

  String get customerName => _customerName;
  Drink get drink => _drink;
  String get instructions => _instructions;
  bool get isCompleted => _isCompleted;

  void markCompleted() => _isCompleted = true;
}
