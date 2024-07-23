import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF3704AF);

const List<Color> _listColors = [
  _customColor,
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.green,
  Colors.blue
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < _listColors.length,
            'selectedColor must be between 0 and ${_listColors.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _listColors[selectedColor],
    );
  }
}
