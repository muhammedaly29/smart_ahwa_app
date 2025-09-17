import 'package:smart_ahwa_manager_app/models/drink.dart';

import '../repositories/i_order_repository.dart';
import '../models/order.dart';

class OrderManager {
  final IOrderRepository _repository;

  OrderManager(this._repository);

  void addOrder(String name, Drink drink, String instructions) {
    if (name.isEmpty) throw ArgumentError('Name required');
    _repository.addOrder(Order(name, drink, instructions));
  }

  List<Order> getPendingOrders() =>
      _repository.getAllOrders().where((o) => !o.isCompleted).toList();

  void completeOrder(Order order) => order.markCompleted();

  List<Order> get allOrders => List.unmodifiable(_repository.getAllOrders());
}
