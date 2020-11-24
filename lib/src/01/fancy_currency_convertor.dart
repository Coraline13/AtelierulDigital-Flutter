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
  double valueInEuro;
  String error, _valueInRon = '';

  void _euroToRonConversion() {
    setState(() {
      _valueInRon = (valueInEuro * 4.87).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff76bb9c),
      ),
      body: Padding(
        padding: EdgeInsets.all(35.0),
        child: Column(
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Currency convertor',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17, height: 2, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              color: const Color(0xffff855c),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: ListTile(
                      leading: Text(
                        'RON',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      title: Align(
                        alignment: Alignment.centerRight,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0.00',
                            errorText: 'error',
                          ),
                          autofocus: true,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 40),
              decoration: InputDecoration(
                hintText: '0.00',
                errorText: error,
              ),
              onChanged: (String value) {
                setState(() {
                  if (double.tryParse(value) == null) {
                    setState(() {
                      error = 'Enter a number';
                    });
                  } else {
                    error = null;
                    valueInEuro = double.parse(value);
                    _valueInRon = '';
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
