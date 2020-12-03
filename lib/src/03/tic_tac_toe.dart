import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  _GamePageState() {
    _boardState = List<String>.filled(9, '');
  }

  List<String> _boardState;

  /// -1 => game not finished
  /// 0 => game finished with tie
  /// 1 => first player wins (X player)
  /// 2 => second player wins (0 player)
  int whichGameState(){
    
  }

  void resetGame() {
    _boardState = List<String>.filled(9, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24135d),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TIC TAC TOE',
          style: TextStyle(
            color: Color(0xffffd033),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xff6648c4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 300.0,
                height: 300.0,
                decoration: BoxDecoration(
                  color: const Color(0xff6648c4),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff332267),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: _selected ? 0.0 : 60.0,
                        height: _selected ? 0.0 : 60.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selected = true;
                            });
                          },
                          child: const Icon(
                            Icons.radio_button_unchecked,
                            size: 60.0,
                            color: Color(0xffffd033),
                          ),
                          // child: const Icon(
                          //   Icons.clear,
                          //   size: 60.0,
                          //   color: Color(0xffeb1750),
                          // ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
