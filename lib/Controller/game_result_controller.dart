import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Model/result.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/constant.dart';

class GameResultController extends ChangeNotifier {
  List<Result> _todayresultL = [];
  List<Result> _otherresultL = [];

  List<Result> get todayresultL => [..._todayresultL];
  List<Result> get otherresultL => [..._otherresultL];

  fetchResult(int categoryId, BuildContext context) async {
    final url = Uri.parse(Api.gameResult);
    String token = sharedPreferences.getString('token').toString();
    bool _isErrorShown = false;

    try {
      if (_isErrorShown) {
        return false;
      }

      http.Response response = await http.post(
        url,
        body: {
          'category_id': categoryId.toString(),
        },
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);

        bool status = decodedData['status'];

        if (status) {
          _todayresultL.clear();
          _otherresultL.clear();
          final currentDate = DateTime.now().toIso8601String().substring(0, 10);
          print("Here is current data");
          final data = await decodedData['data'];
          if (data != null)
            for (var mapItem in data) {
              print(mapItem);
              final gameName = await mapItem["game_name"] ?? 0;
              print(gameName);
              final datalist = await mapItem['win_num'];
              if (datalist != null) {
                for (var map in datalist) {
                  print(map);
                  final item = map as Map<String, dynamic>;

                  if (item['date'] == currentDate) {
                    Result result = Result(
                        id: item['id'] ?? 0,
                        gameName: gameName,
                        single: item['single_number'] ?? '',
                        jodi: item['joddi_number'] ?? '',
                        patti: item['patti_number'] ?? '',
                        cp: item['cp_number'] ?? '',
                        date: item['date'] ?? '');
                    _todayresultL.add(result);
                  } else {
                    print('_=-=-----------------');
                    print(datalist);
                    Result result = Result(
                        id: item['id'] ?? 0,
                        gameName: gameName,
                        single: item['single_number'] ?? '',
                        jodi: item['joddi_number'] ?? '',
                        patti: item['patti_number'] ?? '',
                        cp: item['cp_number'] ?? '',
                        date: item['date']);
                    ;
                    _otherresultL.add(result);
                  }
                }
              }
            }
          notifyListeners();
          return true;
        } else {
          throw decodedData['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      _isErrorShown = true;
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }
}
