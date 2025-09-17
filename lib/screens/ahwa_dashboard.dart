// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';
import 'package:smart_ahwa_manager_app/repositories/in_memory_order_repository.dart';
import 'package:smart_ahwa_manager_app/screens/widgets/custom_button.dart';
import 'package:smart_ahwa_manager_app/screens/widgets/custom_text_field.dart';
import 'package:smart_ahwa_manager_app/screens/widgets/drink_drop_down.dart';
import 'package:smart_ahwa_manager_app/screens/widgets/pending_orders_list_view.dart';
import 'package:smart_ahwa_manager_app/screens/widgets/report_dialog.dart';
import '../models/drink.dart';
import '../services/order_manager.dart';
import '../services/report_generator.dart';

class AhwaDashboard extends StatefulWidget {
  const AhwaDashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AhwaDashboardState createState() => _AhwaDashboardState();
}

class _AhwaDashboardState extends State<AhwaDashboard> {
  late final OrderManager manager;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  Drink? _selectedDrink;
  final List<Drink> drinks = [Shai(), TurkishCoffee(), HibiscusTea()];

  @override
  void initState() {
    super.initState();
    final repository = InMemoryOrderRepository(); // DIP
    manager = OrderManager(repository);
  }

  void _addOrder() {
    if (_nameController.text.isEmpty || _selectedDrink == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    manager.addOrder(
      _nameController.text,
      _selectedDrink!,
      _instructionsController.text,
    );

    setState(() {
      _nameController.clear();
      _instructionsController.clear();
      _selectedDrink = null;
    });
  }

  void _generateReport() {
    final report = ReportGenerator(manager.allOrders);
    final topDrinks = report.getTopSellingDrinks();
    final totalServed = report.getTotalOrdersServed();

    showDialog(
      context: context,
      builder: (context) {
        return ReportDialog(topDrinks: topDrinks, totalServed: totalServed);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Smart Ahwa Manager',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF13315c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              CircleAvatar(radius: 120, backgroundImage: AssetImage(logo)),
              SizedBox(height: 20),
              CustomTextField(
                controller: _nameController,
                label: 'Customer Name',
              ),
              const SizedBox(height: 12),
              DrinkDropdown(
                drinks: drinks,
                selectedDrink: _selectedDrink,
                onChanged: (drink) => setState(() => _selectedDrink = drink),
              ),
              const SizedBox(height: 12),
              CustomTextField(
                controller: _instructionsController,
                label: 'Instructions (e.g., extra mint)',
              ),
              const SizedBox(height: 12),
              CustomButton(
                icon: Icons.add,
                label: 'Add Order',
                onPressed: _addOrder,
                backgroundColor: accentColor,
              ),
              const SizedBox(height: 16),
              const Text(
                'Pending Orders',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
              const SizedBox(height: 8),
              PendingOrdersListView(
                orders: manager.getPendingOrders(),
                onComplete: (order) {
                  manager.completeOrder(order);
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: CustomButton(
                  icon: Icons.bar_chart,
                  label: 'Generate Report',
                  onPressed: _generateReport,
                  backgroundColor: accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
