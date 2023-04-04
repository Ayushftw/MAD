import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _score = '';

  Future<void> _getScore() async {
    final response = await http.get(Uri.parse(
        'https://api.cricapi.com/v1/countries?apikey=f35a416e-a4de-461c-99f7-75a2b2386570'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _score = data['score'];
      });
    } else {
      setState(() {
        _score = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Cricket Score',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Live Cricket Score'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_score',
                style: TextStyle(fontSize: 24.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _getScore,
                child: Text('Refresh Score'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
