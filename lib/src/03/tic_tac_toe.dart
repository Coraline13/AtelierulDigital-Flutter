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
      // debugShowCheckedModeBanner: false,
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
  List<String> _boardState;
  bool _playerXTurn;
  String _gameResult;

  @override
  void initState() {
    super.initState();
    _boardState = List<String>.filled(9, '');
    _playerXTurn = true;
    _gameResult = '';
  }

  /// -1 => game not finished
  /// 0 => game finished with tie
  /// 1 => first X-player wins
  /// 2 => second 0-player wins
  int _whichGameState() {
    /// verify rows
    for (int i = 0; i < 7; i += 3) {
      if (_boardState[i] != '' && _boardState[i] == _boardState[i + 1] && _boardState[i + 1] == _boardState[i + 2]) {
        if (_boardState[i] == 'X') {
          return 1;
        } else {
          return 2;
        }
      }
    }

    /// verify columns
    for (int i = 0; i < 3; i++) {
      if (_boardState[i] != '' && _boardState[i] == _boardState[i + 3] && _boardState[i + 3] == _boardState[i + 6]) {
        if (_boardState[i] == 'X') {
          return 1;
        } else {
          return 2;
        }
      }
    }

    /// verify first diagonal
    if (_boardState[0] != '' && _boardState[0] == _boardState[4] && _boardState[4] == _boardState[8]) {
      if (_boardState[0] == 'X') {
        return 1;
      } else {
        return 2;
      }
    }

    /// verify second diagonal
    if (_boardState[2] != '' && _boardState[2] == _boardState[4] && _boardState[4] == _boardState[6]) {
      if (_boardState[2] == 'X') {
        return 1;
      } else {
        return 2;
      }
    }

    /// verify if there is any empty tile
    for (int i = 0; i < 9; i++) {
      if (_boardState[i] == '') {
        return -1;
      }
    }
    return 0;
  }

  void _playGame(int i) {
    if (_boardState[i] != '' || _gameResult != '') {
      return;
    }

    setState(() {
      _boardState[i] = _playerXTurn ? 'X' : '0';
      _playerXTurn = !_playerXTurn;
      switch (_whichGameState()) {
        case -1:
          return;
        case 0:
          _gameResult = "IT'S A TIE!";
          break;
        case 1:
          _gameResult = 'X-PLAYER WINS!';
          break;
        case 2:
          _gameResult = '0-PLAYER WINS!';
          break;
      }
    });
  }

  void _resetGame() {
    setState(() {
      _boardState = List<String>.filled(9, '');
      _playerXTurn = true;
      _gameResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24135d),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text(
      //     'TIC TAC TOE',
      //     style: TextStyle(
      //       color: Color(0xffffd033),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xff6648c4),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(45.0),
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
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _playGame(i);
                            });
                          },
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.ease,
                            opacity: _boardState[i] == '' ? 0.0 : 1.0,
                            child: _boardState[i] == ''
                                ? const Text('')
                                : (_boardState[i] == 'X'
                                    ? const Icon(
                                        Icons.clear,
                                        size: 60.0,
                                        color: Color(0xffeb1750),
                                      )
                                    : const Icon(
                                        Icons.radio_button_unchecked,
                                        size: 60.0,
                                        color: Color(0xffffd033),
                                      )),
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
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(_gameResult,
                      style: const TextStyle(
                        color: Color(0xffeb1750),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                RaisedButton(
                  color: const Color(0xff6648c4),
                  onPressed: _resetGame,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 0.0,
                  child: const Text(
                    'PLAY AGAIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
