import 'package:flutter/material.dart';
import 'package:mijmajmoe/componenets/square_tile.dart';
import 'package:mijmajmoe/models/emoji_option.dart';
import 'package:mijmajmoe/models/player.dart';
import 'package:mijmajmoe/models/winning_strategy.dart';
import 'choose_emoji_screen.dart';
import 'new_game_dialog.dart';
import 'package:mijmajmoe/player_provider.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audio_cache.dart';

class GridScreen extends StatefulWidget {
  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  int turn;
  bool gameOver;
  WinningStrategy win;
  Player currentPlayer;
  List<SquareTile> squares = [];
  String resultSentence = '';
  Player player1;
  Player player2;
  Player chosingEmoji;
  final List<WinningStrategy> winnableStrategies = WinningStrategy.list();
  final List<EmojiOption> emojiOptions = EmojiOption.list();
  final audioPlayer = AudioCache();

  @override
  void didChangeDependencies() {
    player1 = Provider.of<PlayerProvider>(context).player1;
    player2 = Provider.of<PlayerProvider>(context).player2;
    initGame();
    super.didChangeDependencies();
  }

  void initGame() {
    setState(() {
      turn = 1;
      gameOver = false;
      win = null;
      player1.clearPlays();
      player2.clearPlays();
      currentPlayer = player1;
      resultSentence = '';
      squares = List<SquareTile>.generate(9, (i) {
        return SquareTile(
          index: i,
          character: '',
          tapped: false,
          onTap: (i) {
            tapSquare(i);
          },
          dimmed: false,
        );
      });
    });
  }

  void playSound(String soundFile) {
    audioPlayer.play(soundFile);
  }

  void tapSquare(i) {
    if (gameOver) return;

    setState(() {
      squares[i] = SquareTile(
        dimmed: false,
        index: i,
        character: currentPlayer.character,
        tapped: true,
      );
      currentPlayer.playTurn(i);
      checkForWin();
      if (win != null) {
        gameOver = true;
        resultSentence = "🎉 Player ${currentPlayer.playerIndex} wins 🎉";
        playSound('sounds/yeah.wav');
        squares
            .where((square) => !win.indexes.contains(square.index))
            .forEach((losingSquare) {
          squares[losingSquare.index] = SquareTile(
            dimmed: true,
            character: losingSquare.character,
            onTap: losingSquare.onTap,
            index: losingSquare.index,
            tapped: losingSquare.tapped,
          );
        });
      } else if (turn == squares.length) {
        gameOver = true;
        resultSentence = "Nobody won 😢";
        playSound('sounds/boo.wav');
      } else {
        playSound('sounds/tile.wav');
        currentPlayer = (currentPlayer == player1) ? player2 : player1;
        turn++;
      }
    });
  }

  void checkForWin() {
    winnableStrategies.forEach((strategy) {
      if (strategy.indexes
          .every((element) => currentPlayer.plays.contains(element)))
        win = strategy;
    });
  }

  void showNewGameDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
              child: Text("Choose your emoji",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5)),
          content: NewGameDialog(
            showBottomSheet: (Player player) {
              showBottomSheet(player: player);
            },
            startGame: () {
              initGame();
              closeDialog();
            },
          ),
        );
      },
    );
  }

  void closeDialog() {
    Navigator.of(context, rootNavigator: true).pop('dialog');
  }

  void showBottomSheet({Player player, Function updateCharacter}) {
    emojiOptions.shuffle();
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: ChooseEmojiScreen(
            emojiOptions: emojiOptions,
            player: player,
            otherPlayer: player == player1 ? player2 : player1,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: showNewGameDialog,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
        ),
        child: Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(
              height: 95.0,
            ),
            Flexible(
                child: Text('Mij Maj Moe',
                    style: Theme.of(context).textTheme.headline2)),
            Text(
              'Tic Tac Toe with Emojis 🤔'.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 15.0,
            ),
            Visibility(
              visible: !gameOver,
              child: Container(
                height: 90.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: currentPlayer == player1
                          ? BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text('PLAYER 1',
                                style: Theme.of(context).textTheme.button),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: 1.0,
                                  top: 5.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Text(
                                player1.character,
                                style: TextStyle(fontSize: 27.0),
                              ),
                            ),
                            Text(currentPlayer == player1 ? 'Your turn' : ''),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 45.0),
                    Container(
                      decoration: currentPlayer == player2
                          ? BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              border: Border.all(
                                color: Colors.black54,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            )
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'PLAYER 2',
                              style: Theme.of(context).textTheme.button,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  bottom: 1.0,
                                  top: 5.0,
                                  left: 15.0,
                                  right: 15.0),
                              child: Text(
                                player2.character,
                                style: TextStyle(fontSize: 27.0),
                              ),
                            ),
                            Text(currentPlayer == player2 ? 'Your turn' : '',
                                style: Theme.of(context).textTheme.button),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: gameOver,
              child: Center(
                child: Container(
                  height: 90.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Text(
                          resultSentence,
                          style: TextStyle(fontSize: 30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 450),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, i) {
                  return squares[i];
                },
                itemCount: squares.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
