import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  const BottomButton({Key? key, required this.onTap,required this.buttonTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child:Text(buttonTitle, style:const TextStyle(fontSize: 25),),
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      height: kBottomContainerHeight,
      color: kBottomContainerColor,
      onPressed: () {
        onTap();
      },
    );
  }
}