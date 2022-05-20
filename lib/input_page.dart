import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculate_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selctedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selctedGender = Gender.male;
                          print(Text('MALE button pressed'));
                        });
                      },
                      child: ReusableCard(
                        selctedGender == Gender.male
                            ? KActiveCardColor
                            : KInActiveCardColor,
                        CustomCard(FontAwesomeIcons.mars, 'MALE'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selctedGender = Gender.female;

                          print(Text('FEMALE button pressed'));
                        });
                      },
                      child: ReusableCard(
                          selctedGender == Gender.female
                              ? KActiveCardColor
                              : KInActiveCardColor,
                          CustomCard(FontAwesomeIcons.venus, 'FEMALE')),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  KActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: KNumberBold,
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF8D8E98),
                            ),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 100,
                            max: 220,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      KActiveCardColor,
                      Column(
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 18, color: Color(0xFF8D8E98)),
                          ),
                          Text(
                            weight.toString(),
                            style: KNumberBold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RawMaterialButton(
                                elevation: 0.0,
                                child: Icon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RawMaterialButton(
                                elevation: 0.0,
                                child: Icon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFF4C4F5E),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        KActiveCardColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xFF8D8E98)),
                            ),
                            Text(age.toString(), style: KNumberBold),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RawMaterialButton(
                                  elevation: 0.0,
                                  child: Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  constraints: BoxConstraints.tightFor(
                                    width: 56,
                                    height: 56,
                                  ),
                                  shape: CircleBorder(),
                                  fillColor: Color(0xFF4C4F5E),
                                )
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Bottom_Button(
                buttonName: 'CALCULATE',
                ontapFunction: () {
                  Calculate_Brain calc =
                      Calculate_Brain(height: height, weight: weight);
                  calc.calculateBMI();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultsPage(
                              resultString: calc.stringresult(),
                              resultBMI: calc.calculateBMI(),
                              resultInterpretation: calc.interpretation())));
                }),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onPressed);
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed(),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
