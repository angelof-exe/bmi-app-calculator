import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
