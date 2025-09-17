import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData? icon;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.backgroundColor = const Color(0xFF0077B6),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: primaryColor, size: 20),
      label: Text(
        label,
        style: const TextStyle(fontSize: 18, color: primaryColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
      onPressed: onPressed,
    );
  }
}
