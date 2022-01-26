import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_bottom.dart';
import 'package:bmi_calculator/calculator_brain.dart';

//TODO: enum Gender
enum Gender
{
  male,
  female,
  not,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int valueSlider = 180;

  int valueWeight = 74;

  int valueAge = 19;
  Gender selectedGender = Gender.not;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0d22),
        title: const Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    ////////////////////////TODO:Container 1
                    child: ReusableCard(color: selectedGender == Gender.male
                        ? kBottomContainerColor
                        : kActiveCardColor,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE',)
                    ),
                  ),
                ),
                Expanded(child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  ////////////////////////TODO:Container 2

                  child: ReusableCard(color: selectedGender == Gender.female
                      ? kBottomContainerColor
                      : kActiveCardColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE',)
                  ),
                ),
                ),
              ],
            ),
            //////////////////////TODO:Container 3
            ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('HEIGHT',
                      style: kLabelTextStyle),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(valueSlider.toString(), style: kNumberTextStyle,),
                        const Text('cm', style: kLabelTextStyle,),
                      ]
                  ),
                  Slider(
                    thumbColor: kBottomContainerColor,
                    activeColor: kBottomContainerColor,
                    min: 120,
                    max: 300,
                    value: valueSlider.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        valueSlider = value.round();
                      });
                    },),
                ],
              ),
            ),
            /////////////////////////TODO:Container 4
            Row(
              children: [
                Expanded(child: ReusableCard(color: kActiveCardColor,
                  cardChild: Column(
                    children: [
                      const Text('WEIGHT', style: kLabelTextStyle,),
                      const SizedBox(height: 5,),
                      Text(valueWeight.toString(), style: kNumberTextStyle,),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(onPressed: () {
                            setState(() {
                              if(valueWeight>30)
                                {
                                  valueWeight--;
                                }
                            });
                          }, icon: FontAwesomeIcons.minus),
                          RoundIconButton(onPressed: () {
                            setState(() {
                              if(valueWeight<200)
                                {
                                  valueWeight++;
                                }
                            });
                          }, icon: FontAwesomeIcons.plus),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
                ////////////////////////TODO:Container 5
                Expanded(child: ReusableCard(color: kActiveCardColor,
                  cardChild: Column(
                    children: [
                      const Text('AGE', style: kLabelTextStyle,),
                      const SizedBox(height: 5,),
                      Text(valueAge.toString(), style: kNumberTextStyle,),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundIconButton(onPressed: () {
                            setState(() {
                              if(valueAge>5)
                                {
                                  valueAge--;
                                }
                            });
                          }, icon: FontAwesomeIcons.minus),
                          RoundIconButton(onPressed: () {
                            setState(() {
                              if(valueAge<70) {
                                valueAge++;
                              }
                            });
                          }, icon: FontAwesomeIcons.plus),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            ////////////////////////TODO:Bottom Calculate
            BottomButton(
              buttonTitle: 'Calculate',
              onTap: (){

                CalculatorBrain calc = CalculatorBrain(
                  height: valueSlider,
                  weight: valueWeight,
                );

                Navigator.push(context, MaterialPageRoute(builder: (context) =>ResultsPage(calculatorBrain: calc,)));
              },
            ),
          ],
        ),
      ),
    );
  }
}




