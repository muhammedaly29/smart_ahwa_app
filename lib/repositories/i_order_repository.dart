import 'package:smart_ahwa_manager_app/models/order.dart';

abstract interface class IOrderRepository {
  void addOrder(Order order);
  List<Order> getAllOrders();
}
