import 'package:smart_ahwa_manager_app/models/order.dart';
import 'package:smart_ahwa_manager_app/repositories/i_order_repository.dart';

class InMemoryOrderRepository implements IOrderRepository {
  final List<Order> _orders = [];

  @override
  void addOrder(Order order) => _orders.add(order);

  @override
  List<Order> getAllOrders() => List.unmodifiable(_orders);
}
