import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double bmiResult = 0;

  void calculateBMI() {
    double height =
        double.parse(heightController.text) / 100; // convert cm to m
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: heightController,
              decoration: InputDecoration(
                labelText: 'Height (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              child: Text('Calculate BMI'),
              onPressed: calculateBMI,
            ),
            Text(
              bmiResult == 0
                  ? 'Enter values and press Calculate'
                  : 'Your BMI: $bmiResult',
            ),
          ],
        ),
      ),
    );
  }
}
