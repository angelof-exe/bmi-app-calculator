import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../components/reusable_card.dart';
import '../components/constants.dart';
import '../calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  get onPressed => null;
  int _height = 180;
  int _weight = 60;
  int age = 18;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
        // backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              // Male & Female Card
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ReusableCard(
                    //Male Card
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kMaleActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  //Female Card
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kFemaleActiveCardColor
                        : kInactiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            //Height Slider
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Height",
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kBigLabelTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromARGB(96, 235, 21, 85),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color.fromARGB(47, 235, 21, 85),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 20),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: const Color(0xFFEB1555),s
                      inactiveColor: const Color.fromARGB(255, 185, 185, 185),
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RoundIconButton(
                              child: const Icon(
                                // FontAwesomeIcons.plus,
                                Symbols.add,
                                weight: kIconWeight,
                                size: kIconSize,
                              ),
                              onPress: () {
                                setState(() {
                                  _weight++;
                                });
                              },
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  _weight--;
                                });
                              },
                              child: const Icon(
                                Symbols.remove,
                                size: kIconSize,
                                weight: kIconWeight,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kInactiveCardColor,
                    cardChild: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RoundIconButton(
                              child: const Icon(
                                // FontAwesomeIcons.plus,
                                Symbols.add,
                                weight: kIconWeight,
                                size: kIconSize,
                              ),
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(
                                // FontAwesomeIcons.plus,
                                Symbols.remove,
                                weight: kIconWeight,
                                size: kIconSize,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: _height, weight: _weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calcBrain.calculateBMI(),
                    interpretation: calcBrain.getInterpretation(),
                    results: calcBrain.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              alignment: AlignmentDirectional.center,
              child: const Text(
                'CALCULATE',
                style: kBigContainerTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
