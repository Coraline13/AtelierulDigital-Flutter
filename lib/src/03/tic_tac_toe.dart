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
      home: GamePage(),
    );
  }
}

class Player {
  Player({
    @required this.name,
    this.score = 0.0,
    @required this.playerSymbol,
    @required this.color,
  });

  final String name;
  double score;
  IconData playerSymbol;
  Color color;

  void awardPoints(double points) {
    score += points;
  }
}

class GamePage extends StatefulWidget {
  const GamePage({Key key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> _boardState;
  String _gameStartMessage, _gameResult;
  List<int> _winnerLine;
  List<Player> _players;
  bool _isPlayer1Turn, _isPlayer1First;

  @override
  void initState() {
    super.initState();
    _boardState = List<String>.filled(9, '');
    _gameResult = '';
    _gameStartMessage = "X-PLAYER'S TURN";
    _winnerLine = <int>[];
    _players = <Player>[
      Player(
        name: 'X-PLAYER',
        playerSymbol: Icons.clear,
        color: const Color(0xffeb1750),
      ),
      Player(
        name: '0-PLAYER',
        playerSymbol: Icons.radio_button_unchecked,
        color: const Color(0xffffd033),
      ),
    ];
    _isPlayer1Turn = _isPlayer1First = true;
  }

  int _check(int i, int j, int k) {
    if (_boardState[i] != '' &&
        _boardState[i] == _boardState[j] &&
        _boardState[j] == _boardState[k]) {
      _winnerLine.addAll(<int>[i, j, k]);

      if (_boardState[i] == 'X') {
        return 1;
      } else {
        return 2;
      }
    }

    return -1;
  }

  /// -1 => game not finished
  /// 0 => game finished with tie
  /// 1 => first X-player wins
  /// 2 => second 0-player wins
  int _whichGameState() {
    /// verify rows
    int result = -1;
    for (int i = 0; i < 7; i += 3) {
      result = _check(i, i + 1, i + 2);
      if (result != -1) {
        return result;
      }
    }

    /// verify columns
    for (int i = 0; i < 3; i++) {
      result = _check(i, i + 3, i + 6);
      if (result != -1) {
        return result;
      }
    }

    /// verify first diagonal
    result = _check(0, 4, 8);
    if (result != -1) {
      return result;
    }

    /// verify second diagonal
    result = _check(2, 4, 6);
    if (result != -1) {
      return result;
    }

    /// verify if there is any empty tile
    for (int i = 0; i < 9; i++) {
      if (_boardState[i] == '') {
        return -1;
      }
    }
    return 0;
  }

  void _playTurn(int i) {
    _gameStartMessage = '';

    if (_boardState[i] != '' || _gameResult != '') {
      return;
    }

    setState(() {
      _boardState[i] = _isPlayer1Turn ? 'X' : '0';
      _isPlayer1Turn = !_isPlayer1Turn;
      switch (_whichGameState()) {
        case -1:
          break;
        case 0:
          _gameResult = "IT'S A TIE!";
          _players[0].awardPoints(0.5);
          _players[1].awardPoints(0.5);
          break;
        case 1:
          _gameResult = 'X-PLAYER WINS!';
          _players[0].awardPoints(1.0);
          break;
        case 2:
          _gameResult = '0-PLAYER WINS!';
          _players[1].awardPoints(1.0);
          break;
      }
    });
  }

  void _resetGame() {
    setState(() {
      _boardState = List<String>.filled(9, '');

      /// alternate who starts the game
      /// if last game was not finished, the same player starts
      _isPlayer1Turn = _isPlayer1First =
          _gameResult == '' ? _isPlayer1First : !_isPlayer1First;
      _gameResult = '';
      _winnerLine = <int>[];
      _gameStartMessage =
          _isPlayer1Turn ? "X-PLAYER'S TURN" : "0-PLAYER'S TURN";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff24135d),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 35.0, bottom: 35.0, left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    _gameStartMessage == '' ? _gameResult : _gameStartMessage,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6648c4),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int i) {
                      final int player = _boardState[i] == 'X' ? 0 : 1;
                      final bool isEmpty = _boardState[i] == '';
                      return Container(
                        decoration: BoxDecoration(
                          color: _winnerLine.contains(i)
                              ? const Color(0xff27d075)
                              : const Color(0xff332267),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _playTurn(i);
                            });
                          },
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.ease,
                            opacity: isEmpty ? 0.0 : 1.0,
                            child: isEmpty
                                ? const Text('')
                                : LayoutBuilder(builder: (BuildContext context,
                                    BoxConstraints constraint) {
                                    return Icon(
                                      _players[player].playerSymbol,
                                      size: constraint.biggest.height,
                                      color: _winnerLine.contains(i)
                                          ? Colors.white
                                          : _players[player].color,
                                    );
                                  }),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                child: RaisedButton(
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
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (BuildContext context, int j) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: const Color(0xff6648c4),
                            width: 2.0,
                          )),
                      child: ListTile(
                        title: Text(
                          _players[j].name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${_players[j].score} pts',
                          style: const TextStyle(color: Color(0xff27d075)),
                        ),
                        leading: Icon(
                          _players[j].playerSymbol,
                          size: 40.0,
                          color: _players[j].color,
                        ),
                        trailing: _players[j].score >
                                (_players[0].score + _players[1].score) / 2
                            ? const Icon(
                                Icons.emoji_events,
                                size: 30.0,
                                color: Color(0xffffd033),
                              )
                            : const Text(''),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
