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
    setState(() {
      _boardState = List<String>.filled(10, '');
    });
  }

  List<String> _boardState;
  bool _playerXTurn = true;
  String _gameResult = '';
  Color _xColor = const Color(0xff332267);

  /// -1 => game not finished
  /// 0 => game finished with tie
  /// 1 => first X-player wins
  /// 2 => second 0-player wins
  int _whichGameState() {
    /// verify rows
    for (int i = 1; i <= 7; i += 3) {
      if (_boardState[i] != '' && _boardState[i] == _boardState[i + 1] && _boardState[i + 1] == _boardState[i + 2]) {
        if (_boardState[i] == 'X') {
          return 1;
        } else {
          return 2;
        }
      }
    }

    /// verify columns
    for (int i = 1; i <= 3; i++) {
      if (_boardState[i] != '' && _boardState[i] == _boardState[i + 3] && _boardState[i + 3] == _boardState[i + 6]) {
        if (_boardState[i] == 'X') {
          return 1;
        } else {
          return 2;
        }
      }
    }

    /// verify first diagonal
    if (_boardState[1] != '' && _boardState[1] == _boardState[5] && _boardState[5] == _boardState[9]) {
      if (_boardState[1] == 'X') {
        return 1;
      } else {
        return 2;
      }
    }

    /// verify second diagonal
    if (_boardState[3] != '' && _boardState[3] == _boardState[5] && _boardState[5] == _boardState[7]) {
      if (_boardState[3] == 'X') {
        return 1;
      } else {
        return 2;
      }
    }

    /// verify if there is any empty tile
    for (int i = 1; i <= 9; i++) {
      if (_boardState[i] == '') {
        return -1;
      }
    }
    return 0;
  }

  void _playGame(int i) {
    _boardState[i] = _playerXTurn ? 'X' : '0';
    _playerXTurn = !_playerXTurn;
    switch (_whichGameState()) {
      case -1:
        return;
      case 0:
        _gameResult = "It's a tie!";
        break;
      case 1:
        _gameResult = 'X-player wins!';
        break;
      case 2:
        _gameResult = '0-player wins!';
        break;
    }
  }

  void _resetGame() {
    setState(() {
      _boardState = List<String>.filled(9, '');
    });
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
                        color: _boardState[i] == '' ? Colors.blue : (_boardState[i] == 'X' ? Colors.red : Colors.green),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: _boardState[i].isNotEmpty ? 0.0 : 60.0,
                        height: _boardState[i].isNotEmpty ? 0.0 : 60.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _playGame(i);
                            });
                          },
                          // child: const Icon(
                          //   Icons.radio_button_unchecked,
                          //   size: 60.0,
                          //   color: Color(0xffffd033),
                          // ),
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
              RaisedButton(
                color: const Color(0xff6648c4),
                onPressed: _resetGame,
                child: const Text(
                  'Reset game',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
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
