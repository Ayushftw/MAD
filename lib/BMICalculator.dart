import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMetric = true; // initial measurement system is metric
  double height = 0;
  double weight = 0;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMetric = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: isMetric ? Colors.blue : Colors.grey,
                  ),
                  child: Text('Metric', style: TextStyle(fontSize: 18)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMetric = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: !isMetric ? Colors.blue : Colors.grey,
                  ),
                  child: Text('Imperial', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText:
                    isMetric ? 'height in centimeters' : 'height in inches',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: isMetric ? 'weight in kilos' : 'weight in lb',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                bmi = isMetric
                    ? calculateMetricBMI(height, weight)
                    : calculateImperialBMI(height, weight);
                setState(() {});
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            bmi > 0
                ? Text(
                    'Your BMI is: ${bmi.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 24),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  // Calculate BMI for metric system
  double calculateMetricBMI(double height, double weight) {
    return weight / ((height / 100) * (height / 100));
  }

  // Calculate BMI for imperial system
  double calculateImperialBMI(double height, double weight) {
    return (weight / (height * height)) * 703;
  }
}
