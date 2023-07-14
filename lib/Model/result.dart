class Result {
  int id;
  String gameName;
  String single;
  String jodi;
  String patti;
  String cp;
  String date;

  Result({
    required this.id,
    required this.gameName,
    required this.single,
    required this.jodi,
    required this.patti,
    required this.cp,
    required this.date,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'] ?? -1,
      gameName: map['game_name'] ?? '',
      single: map['single_number'] ?? '',
      jodi: map['joddi_number'] ?? '',
      patti: map['patti_number'] ?? '',
      cp: map['cp_number'] ?? '',
      date: map['date'] ?? '',
    );
  }
}
