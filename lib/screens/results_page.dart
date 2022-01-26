import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key, required this.calculatorBrain}) : super(key: key);
  final CalculatorBrain calculatorBrain;
  @override
  Widget build(BuildContext context) {
    String result = calculatorBrain.calculatorBMI();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:const Color(0xFF0A0E21),
        title: const Text('BMI Calculator'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:  [
          Expanded(
              child: Container(
                padding:const EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child:const Text(
                'Your Result',
                style: kTitleTextStyle,
                ),
              ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Text(calculatorBrain.getResult(),style: kResultTextStyle,),
                  Text(result,style: kBMITextStyle,),
                  Text(calculatorBrain.getInterpretation(),style: kBodyTextStyle,textAlign: TextAlign.center,),
                ],
              ),
            ) ,
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttonTitle: 'Re-Calculate')
        ],
      ),
    );
  }
}
