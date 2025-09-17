import 'package:smart_ahwa_manager_app/models/order.dart';

abstract class IReportGenerator {
  Map<String, int> getTopSellingDrinks();
  int getTotalOrdersServed();
}

class ReportGenerator implements IReportGenerator {
  final List<Order> _orders;

  ReportGenerator(this._orders);

  @override
  Map<String, int> getTopSellingDrinks() {
    final Map<String, int> counts = {};
    for (var order in _orders) {
      counts.update(order.drink.name, (value) => value + 1, ifAbsent: () => 1);
    }
    return counts;
  }

  @override
  int getTotalOrdersServed() => _orders.where((o) => o.isCompleted).length;
}
