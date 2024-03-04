import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 70, color: Colors.black),
        const SizedBox(height: 15),
        Text(label,
            style: const TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w600))
      ],
    );
  }
}
