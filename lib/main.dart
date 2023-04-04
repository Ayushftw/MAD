import 'package:first_app/BMICalculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  return const MaterialApp(
    //  home: center (child SafeArea(child :Text("Hello Flutter"))));
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: BMICalculator());
  }
}
