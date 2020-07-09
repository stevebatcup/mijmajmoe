import 'package:flutter/material.dart';
import 'package:mijmajmoe/models/emoji_option.dart';
import 'package:mijmajmoe/models/player.dart';
import 'package:provider/provider.dart';

import '../player_provider.dart';

class ChooseEmojiScreen extends StatelessWidget {
  ChooseEmojiScreen({
    this.emojiOptions,
    this.player,
    this.otherPlayer,
  });

  final List<EmojiOption> emojiOptions;
  final Player player;
  final Player otherPlayer;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, widg) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Choose Emoji for Player ${player.playerIndex}",
                  style: Theme.of(context).textTheme.headline5),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                height: 280.0,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (context, i) {
                    bool isAlreadyChosen =
                        player.character == emojiOptions[i].character;
                    bool isChosenByOtherPlayer =
                        otherPlayer.character == emojiOptions[i].character;
                    return Center(
                      child: Container(
                        padding: EdgeInsets.all(1.0),
                        color: isAlreadyChosen
                            ? Colors.black12
                            : Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: FlatButton(
                            splashColor: Colors.transparent,
                            onPressed: isChosenByOtherPlayer
                                ? null
                                : () {
                                    playerProvider.updateCharacterForPlayer(
                                        player: player,
                                        emojiOption: emojiOptions[i]);
                                    Navigator.pop(context);
                                  },
                            child: Center(
                              child: Text(
                                emojiOptions[i].character,
                                style: TextStyle(fontSize: 38.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: emojiOptions.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
