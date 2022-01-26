import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.label}) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 90),
        const SizedBox(height: 20,),
        Text(
          label,
          style:kLabelTextStyle,)
      ],
    );
  }
}