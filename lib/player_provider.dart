import 'package:flutter/material.dart';
import 'package:mijmajmoe/emoji_option.dart';
import 'player.dart';

class PlayerProvider extends ChangeNotifier {
  final Player player1;
  final Player player2;

  PlayerProvider(this.player1, this.player2);

  void updateCharacterForPlayer({Player player, EmojiOption emojiOption}) {
    player.character = emojiOption.character;
    notifyListeners();
  }
}
