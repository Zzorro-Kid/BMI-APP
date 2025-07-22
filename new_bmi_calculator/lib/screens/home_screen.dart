import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_card.dart';
import '../widgets/round_icon_button.dart';
import '../screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int height = 180;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        children: [
          CustomCard(
            child: Column(
              children: [
                Text('Height', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$height', style: kNumberTextStyle),
                    Text('cm', style: kLabelTextStyle),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (value) {
                    setState(() => height = value.round());
                  },
                ),
              ],
            ),
          ),

          CustomCard(
            child: Column(
              children: [
                Text('Weight', style: kLabelTextStyle),
                Text('$weight', style: kNumberTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(
                      icon: Icons.remove,
                      onPressed: () => setState(() => weight--),
                    ),
                    SizedBox(width: 10),
                    RoundIconButton(
                      icon: Icons.add,
                      onPressed: () => setState(() => weight++),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: () {
              final bmi = calculateBMI(height, weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(bmi: bmi),
                ),
              );
            },
            child: Text('Count BMI'),
          ),
        ],
      ),
    );
  }

  double calculateBMI(int height, int weight) {
    return weight / ((height / 100) * (height / 100));
  }
}