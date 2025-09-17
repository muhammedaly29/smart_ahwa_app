import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';
import 'package:smart_ahwa_manager_app/screens/ahwa_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: primaryColor),
      debugShowCheckedModeBanner: false,
      home: const AhwaDashboard(),
    );
  }
}
