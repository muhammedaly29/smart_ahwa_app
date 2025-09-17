import 'package:flutter/material.dart';
import 'package:smart_ahwa_manager_app/constants.dart';
import '../../models/drink.dart';

class DrinkDropdown extends StatelessWidget {
  final List<Drink> drinks;
  final Drink? selectedDrink;
  final ValueChanged<Drink?> onChanged;

  const DrinkDropdown({
    super.key,
    required this.drinks,
    required this.selectedDrink,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Drink>(
      value: selectedDrink,
      decoration: InputDecoration(
        labelText: 'Select a Drink',
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      items: drinks
          .map((d) => DropdownMenuItem<Drink>(value: d, child: Text(d.name)))
          .toList(),
      dropdownColor: primaryColor,

      onChanged: onChanged,
    );
  }
}
