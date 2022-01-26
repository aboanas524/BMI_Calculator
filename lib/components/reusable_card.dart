import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;

  const ReusableCard({Key? key, required this.color,required this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}