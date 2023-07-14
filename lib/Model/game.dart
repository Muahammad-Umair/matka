class GameCategory {
  int id;
  String name;
  String title;
  // String subtitle;
  String image;
  String start_time;
  String end_time;
  bool timeOut;

  GameCategory({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.start_time,
    required this.end_time,
    required this.timeOut,
  });

  factory GameCategory.fromMap(Map<String, dynamic> map) {
    return GameCategory(
      id: map['id'] ?? -1,
      name: map['Name'] ?? "",
      title: map['title'] ?? '',
      image: map['image'] ?? "",
      start_time: map['start_time'] ?? '',
      end_time: map['end_time'] ?? "",
      timeOut: map['is_time_out'] == 'closed' ? true : false,
    );
  }
}

class Game {
  int id;
  String name;
  String title;
  // String subtitle;
  String image;
  String start_time;
  String end_time;

  Game({
    required this.id,
    required this.name,
    required this.title,
    required this.image,
    required this.start_time,
    required this.end_time,
  });

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] ?? -1,
      name: map['name'] ?? "",
      title: map['game_category']['title'] ?? '',
      image: map['image'] ?? "",
      start_time: map['start_time'] ?? '',
      end_time: map['end_time'] ?? "",
    );
  }
}
