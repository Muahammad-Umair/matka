import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Utilies/constant.dart';

class RulesController extends ChangeNotifier {
  List<String> _rulesText = [];
  List<String> get rulesText => [..._rulesText];

  fetchRules() async {
    final url = Uri.parse(Api.gameRules);
    String token = sharedPreferences.getString('token').toString();
    http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedData = jsonDecode(response.body);

      bool status = decodedData['status'];

      if (status) {
        var datamap = decodedData['data'];
        _rulesText = [];
        if (datamap != null) {
          for (var map in datamap) {
            _rulesText.add(map['title_one']);
          }
          notifyListeners();
        }
      }
    }
  }
}
