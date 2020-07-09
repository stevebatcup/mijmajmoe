import 'package:flutter/material.dart';
import 'package:mijmajmoe/player_provider.dart';
import 'package:provider/provider.dart';

class NewGameDialog extends StatelessWidget {
  NewGameDialog({
    @required this.showBottomSheet,
    @required this.startGame,
  });

  final Function showBottomSheet;
  final Function startGame;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, widg) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('PLAYER 1',
                        style: Theme.of(context).textTheme.bodyText2),
                    FlatButton(
                      onPressed: () {
                        showBottomSheet(playerProvider.player1);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            bottom: 15.0, top: 5.0, left: 10.0, right: 10.0),
                        child: Text(
                          playerProvider.player1.character,
                          style: TextStyle(fontSize: 50.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'PLAYER 2',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    FlatButton(
                      onPressed: () {
                        showBottomSheet(playerProvider.player2);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                            bottom: 15.0, top: 5.0, left: 10.0, right: 10.0),
                        child: Text(
                          playerProvider.player2.character,
                          style: TextStyle(fontSize: 50.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              color: Theme.of(context).colorScheme.primaryVariant,
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                startGame();
              },
            ),
          ],
        );
      },
    );
  }
}
