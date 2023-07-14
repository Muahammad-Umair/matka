import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';

class ReferHistory {
  String name;
  String number;
  ReferHistory({required this.name, required this.number});
  factory ReferHistory.fromMap(Map<String, dynamic> map) {
    return ReferHistory(name: map['first_name'], number: map['phone_number']);
  }
}

class ReferHistoryController extends ChangeNotifier {
  List<ReferHistory> _referHistoryList = [];

  List<ReferHistory> get referHistoryList => [..._referHistoryList];

  fetchRefer() async {
    final url = Uri.parse(Api.referalHistory);
    http.Response response = await http.post(url);
    var decodedData = jsonDecode(response.body);

    bool status = decodedData['status'];

    if (status) {
      _referHistoryList = [];
      var datamap = await decodedData['data'];

      if (datamap != null) {
        for (var data in datamap) {
          ReferHistory referHistory = await ReferHistory.fromMap(data);
          _referHistoryList.add(referHistory);
        }
        notifyListeners();
      }
    }
  }
}
