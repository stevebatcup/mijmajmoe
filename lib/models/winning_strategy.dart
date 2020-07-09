enum WinningStrategyLineDirection {
  horizontal,
  vertical,
  diagonalLeft,
  diagonalRight,
}

class WinningStrategy {
  final List<int> indexes;
  final WinningStrategyLineDirection lineDirection;
  final Map<String, double> lineStartingCoordinates;

  WinningStrategy(
      {this.indexes, this.lineDirection, this.lineStartingCoordinates});

  static List<WinningStrategy> list() {
    return <WinningStrategy>[
      WinningStrategy(
        indexes: [0, 1, 2],
        lineDirection: WinningStrategyLineDirection.horizontal,
        lineStartingCoordinates: {'x': 0.0, 'y': 50.0},
      ),
      WinningStrategy(
        indexes: [3, 4, 5],
        lineDirection: WinningStrategyLineDirection.horizontal,
        lineStartingCoordinates: {'x': 0.0, 'y': 100.0},
      ),
      WinningStrategy(
        indexes: [6, 7, 8],
        lineDirection: WinningStrategyLineDirection.horizontal,
        lineStartingCoordinates: {'x': 0.0, 'y': 150.0},
      ),
      WinningStrategy(
        indexes: [0, 3, 6],
        lineDirection: WinningStrategyLineDirection.vertical,
        lineStartingCoordinates: {'x': 50.0, 'y': 0.0},
      ),
      WinningStrategy(
        indexes: [1, 4, 7],
        lineDirection: WinningStrategyLineDirection.vertical,
        lineStartingCoordinates: {'x': 100.0, 'y': 0.0},
      ),
      WinningStrategy(
        indexes: [2, 5, 8],
        lineDirection: WinningStrategyLineDirection.vertical,
        lineStartingCoordinates: {'x': 150.0, 'y': 0.0},
      ),
      WinningStrategy(
        indexes: [0, 4, 8],
        lineDirection: WinningStrategyLineDirection.diagonalLeft,
        lineStartingCoordinates: {'x': 0.0, 'y': 0.0},
      ),
      WinningStrategy(
        indexes: [2, 4, 6],
        lineDirection: WinningStrategyLineDirection.diagonalRight,
        lineStartingCoordinates: {'x': 200.0, 'y': 0.0},
      ),
    ];
  }
}
