class Player {
  final int playerIndex;
  String character;
  List<int> _plays = <int>[];

  Player({this.playerIndex, this.character});

  void playTurn(tileIndex) {
    _plays.add(tileIndex);
  }

  List<int> get plays {
    return _plays;
  }

  void clearPlays() {
    _plays.clear();
  }
}
