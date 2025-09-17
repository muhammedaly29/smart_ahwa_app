import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';

class ReportDialog extends StatelessWidget {
  final Map<String, int> topDrinks;
  final int totalServed;

  const ReportDialog({
    super.key,
    required this.topDrinks,
    required this.totalServed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: const Text(
        'Report',
        style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Orders Served: $totalServed',
            style: TextStyle(color: accentColor),
          ),
          const SizedBox(height: 10),
          const Text('Top Drinks:', style: TextStyle(color: accentColor)),
          ...topDrinks.entries.map(
            (entry) => Text('${entry.key}: ${entry.value}'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
