import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Model/game.dart';
import 'package:matka/Utilies/constant.dart';

class GamesCategoryController extends ChangeNotifier {
  List<GameCategory> _gameCatergory = [];
  List<GameCategory> get game => [..._gameCatergory];

  Future<bool> fetchCatergories(BuildContext context) async {
    try {
      final url = Uri.parse(Api.catergories);
      String token = await sharedPreferences.getString('token').toString();
      print(token);
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        bool status = decodedData['status'];
        print("Here is datalist+++++++++++++++++++++++++ $status");
        if (status) {
          _gameCatergory.clear();

          var datalist = await decodedData['data'] ?? null;
          print("Here is datalist+++++++++++++++++++++++++");
          if (datalist != null) {
            print("Here is datalist+++++++++++++++++++++++++");
            for (var map in datalist) {
              final item = map as Map<String, dynamic>;
              GameCategory game = GameCategory.fromMap(item);
              _gameCatergory.add(game);
            }
            notifyListeners();
            return true;
          } else {
            return false;
          }
        } else {
          throw decodedData['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
