import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  _HomePageState() {
    final Random _random = Random();
    _numberToBeGuessed = _random.nextInt(99) + 1;
  }

  int _inputNumber, _numberToBeGuessed;
  bool _error = true;
  String _message = '';

  void _resetNumberToBeGuessed() {
    final Random _random = Random();
    _numberToBeGuessed = _random.nextInt(99) + 1;
  }

  Future<void> _guessMyNumber() async {
    final String str = 'You tried $_inputNumber\n';

    if (_inputNumber < _numberToBeGuessed) {
      _message = str + 'Try higher';
      return;
    } else if (_inputNumber > _numberToBeGuessed) {
      _message = str + 'Try lower';
      return;
    }
    _message = str + 'You guessed right.';
    await showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_inputNumber.toString()),
            content: Text(_message),
            actions: <Widget>[
              FlatButton(
                onPressed: _resetNumberToBeGuessed,
                child: const Text('Try again!'),
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print('build' + _message);
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
            Text(
              _message,
              style: const TextStyle(
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
            Card(
              elevation: 5,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Try a number',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        if (int.tryParse(value) == null) {
                          setState(() {
                            _error = true;
                          });
                        } else {
                          _error = false;
                          _inputNumber = int.parse(value);
                        }
                      });
                    },
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (!_error) {
                        setState(() {
                          _guessMyNumber();
                        });
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
