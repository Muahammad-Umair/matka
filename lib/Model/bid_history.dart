class BidHistory {
  int id;
  String gameType;
  String gameName;
  String digit;
  String amount;
  String time;
  String win;
  String winNumber;
  String winAmount;

  BidHistory({
    required this.id,
    required this.gameType,
    required this.digit,
    required this.amount,
    required this.time,
    required this.win,
    required this.winNumber,
    required this.winAmount,
    required this.gameName,
  });

  factory BidHistory.fromMap(Map<String, dynamic> map) {
    return BidHistory(
      id: map['id'] ?? -1,
      gameType: map['game_type'] ?? '',
      digit: map['digit'] ?? '',
      amount: map['amount'] ?? '',
      time: map['time'] ?? '',
      winNumber: map['win_number'] ?? '',
      winAmount: map['win_amount'] ?? '',
      gameName: map['game_name'] ?? '',
      win: map['is_win'] == "0"
          ? "Loose"
          : map['is_win'] == "1"
              ? "Win"
              : "Pending",
    );
  }
}
