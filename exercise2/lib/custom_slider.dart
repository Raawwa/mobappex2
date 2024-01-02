import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final Color color;

  CustomSlider({
    required this.value,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 0.0,
      max: 255.0,
      divisions: 255,
      onChanged: onChanged,
      activeColor: color,
    );
  }
}
