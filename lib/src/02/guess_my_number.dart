import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _inputNumber, _numberToBeGuessed;
  String _error;

  Future<void> _guessMyNumber() async {
    String str = 'You tried $_numberToBeGuessed\n';

    if (_inputNumber < _numberToBeGuessed) {
      return str + 'Try higher';
    } else if (_inputNumber > _numberToBeGuessed) {
      return str + 'Try lower';
    }
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_inputNumber.toString()),
            content: Text(str + 'You guessed right.'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Guess my number'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            const Text(
              "I'm thinking of a number between 1 and 100.",
              style: TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              "It's your turn to guess my number!",
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Card(
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: _error,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        if (int.tryParse(value) == null) {
                          setState(() {
                            _error = 'Enter a number';
                          });
                        } else {
                          _error = null;
                          _inputNumber = int.parse(value);
                        }
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_error == null) {
                        _guessMyNumber();
                      }
                    },
                    child: const Text('Guess'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
