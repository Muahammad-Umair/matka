import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Model/game.dart';
import 'package:matka/Utilies/constant.dart';

class GamesController extends ChangeNotifier {
  List<Game> _game = [];
  List<Game> get game => [..._game];

  Future<bool> fetchGames(int gameId) async {
    try {
      final url = Uri.parse(Api.gamesCategories);
      String token = sharedPreferences.getString('token').toString();
      http.Response response = await http.post(
        url,
        body: {
          'game_id': gameId.toString(),
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        bool status = decodedData['status'];

        if (status) {
          _game.clear();
          final datalist = await decodedData['data'];
          if (datalist != null) {
            for (var map in datalist) {
              final item = map as Map<String, dynamic>;
              Game game = Game.fromMap(item);
              _game.add(game);
            }
            notifyListeners();
          }
          return true;
        } else {
          throw decodedData['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      return false;
    }
  }

  Future<Game> findById(int id) async {
    return await _game.firstWhere((gam) => gam.id == id);
  }
}
