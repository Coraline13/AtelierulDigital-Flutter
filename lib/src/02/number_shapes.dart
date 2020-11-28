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
  int _inputNumber;
  String _error;

  bool _isSquare(int number) {
    return number == pow(sqrt(number).round(), 2);
  }

  bool _isTriangular(int number) {
    return number == pow(pow(number, 1 / 3).round(), 3);
  }

  String _beautifulMessage() {
    String _str = 'Number $_inputNumber is ';

    if (_isSquare(_inputNumber)) {
      if (_isTriangular(_inputNumber)) {
        return _str + 'both SQUARE and TRIANGULAR.';
      }
      return _str + 'SQUARE.';
    } else if (_isTriangular(_inputNumber)) {
      return _str + 'TRIANGULAR.';
    }
    return _str + 'neither SQUARE or TRIANGULAR.';
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(_inputNumber.toString()),
            content: Text(_beautifulMessage()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Number shapes'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Text(
                'Please input a number to see if it is square or triangular.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
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
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_error == null) {
            _showMyDialog();
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
