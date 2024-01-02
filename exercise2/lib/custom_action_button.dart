import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double size;

  const CustomActionButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.size = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      iconSize: size,
    );
  }
}
