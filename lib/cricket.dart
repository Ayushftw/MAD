import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Live Cricket Scores',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _liveScores = "";

  Future<void> _getLiveScores() async {
    final response = await http.get(Uri.parse(
        'https://api.cricketapi.com/cricket_score?apikey=f35a416e-a4de-461c-99f7-75a2b2386570'));
    if (response.statusCode == 200) {
      setState(() {
        _liveScores = json.decode(response.body)['data']['score'];
      });
    } else {
      throw Exception('Failed to load live scores');
    }
  }

  @override
  void initState() {
    super.initState();
    _getLiveScores();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Cricket Scores'),
      ),
      body: Center(
        child: Text(
          _liveScores,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
