import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatefulWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);
  final IconData icon;
  final Function onPressed;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:(){widget.onPressed();},
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      child: Icon(widget.icon),
      focusColor: kBottomContainerColor,
      fillColor: kRoundIconButton,
    );
  }
}