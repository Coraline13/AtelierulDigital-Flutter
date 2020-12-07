import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Basic Phrases',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class Word {
  Word(this.romanianWord, this.romanianFileLocation, this.frenchFileLocation);

  final String romanianWord;
  final String romanianFileLocation;
  final String frenchFileLocation;
}

class _HomePageState extends State<HomePage> {
  final AssetsAudioPlayer _player = AssetsAudioPlayer.newPlayer();
  final List<Word> _words = <Word>[
    Word('salut', 'assets/audio/salut_ro.mp3', 'assets/audio/salut_fr.mp3'),
    Word('mă numesc', 'assets/audio/ma_numesc_ro.mp3', 'assets/audio/ma_numesc_fr.mp3'),
    Word('cum ești?', 'assets/audio/cum_esti_ro.mp3', 'assets/audio/cum_esti_fr.mp3'),
    Word('la revedere', 'assets/audio/la_revedere_ro.mp3', 'assets/audio/la_revedere_fr.mp3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Basic Phrases'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 32.0,
        ),
        itemCount: _words.length * 2,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.blue, Colors.lightBlueAccent],
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: SizedBox.expand(
                child: MaterialButton(
                  onPressed: () async {
                    final Audio audio = i % 2 == 0
                        ? Audio(_words[i ~/ 2].romanianFileLocation)
                        : Audio(_words[i ~/ 2].frenchFileLocation);
                    await _player.stop();
                    await _player.open(audio);
                  },
                  child: Text(
                    i % 2 == 0 ? _words[i ~/ 2].romanianWord : '${_words[i ~/ 2].romanianWord} (franceză)',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
