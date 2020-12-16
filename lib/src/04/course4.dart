import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  List<String> countryNames = <String>[];
  List<String> countryImages = <String>[];

  Future<void> getFlags() async {
    final Response response = await get('https://www.worldometers.info/geography/flags-of-the-world/');
    final String data = response.body;
    final List<String> items = data.split('<a href="/img/flags');
    setState(() {
      for (final String item in items.skip(1)) {
        const String countryTitlePattern = 'padding-top:10px">';
        countryNames.add(
            item.substring(item.indexOf(countryTitlePattern) + countryTitlePattern.length, item.indexOf('</div>')));

        countryImages.add('https://www.worldometers.info/img/flags${item.split('"')[0]}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flags of the world'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
        ),
        itemCount: 100,
        itemBuilder: (BuildContext context, int i) {
          getFlags();
          return Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(countryNames[i]),
                  Image.network(countryImages[i]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
