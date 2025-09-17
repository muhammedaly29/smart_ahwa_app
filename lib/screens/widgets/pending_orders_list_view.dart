import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';
import '../../models/order.dart';

class PendingOrdersListView extends StatelessWidget {
  final List<Order> orders;
  final Function(Order) onComplete;

  const PendingOrdersListView({
    super.key,
    required this.orders,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, i) {
          final order = orders[i];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              tileColor: primaryColor,
              title: Text('${order.customerName} - ${order.drink.name}'),
              subtitle: Text(order.instructions),
              trailing: IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () => onComplete(order),
              ),
            ),
          );
        },
      ),
    );
  }
}
