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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Currency convertor'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(
                'https://www.eurorateforecast.com/wordpress/wp-content/uploads/2016/11/range-of-euro-coins-notes-1280x720.jpg'),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'enter the amount in EUR',
                errorText: error,
              ),
              onChanged: (String value) {
                setState(() {
                  if (double.tryParse(value) == null) {
                    setState(() {
                      error = 'Introdu un numar';
                    });
                  } else {
                    error = null;
                    valueInEuro = double.parse(value);
                    _valueInRon = '';
                  }
                });
              },
            ),
            RaisedButton(
              // textColor: Colors.white,
              color: Colors.white30,
              onPressed: () {
                if (error == null) {
                  _euroToRonConversion();
                }
              },
              child: Text('CONVERT!'),
            ),
            Text(
              _valueInRon,
              style: TextStyle(fontSize: 30, height: 2),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
