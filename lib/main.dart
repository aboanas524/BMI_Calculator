import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
