import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Model/transaction.dart';
import 'package:matka/Utilies/constant.dart';

class WithdrawHistoryC extends ChangeNotifier {
  List<Transaction> _transaction = [];

  List<Transaction> get transaction => [..._transaction];

  fetchTransaction() async {
    final url = Uri.parse(Api.withdrawhistory);
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
        _transaction = [];
        var datamap = decodedData['data'];
        print("$datamap !@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        if (datamap != null) {
          for (var map in datamap) {
            Transaction transaction = await Transaction.fromMap(map);
            _transaction.add(transaction);
          }
        }

        notifyListeners();
      }
    }
  }
}

class DepositHistoryC extends ChangeNotifier {
  List<Transaction> _transaction = [];

  List<Transaction> get transaction => [..._transaction];

  fetchTransaction() async {
    final url = Uri.parse(Api.deposithistory);
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
        _transaction = [];
        var datamap = decodedData['data'];
        if (datamap != null) {
          for (var map in datamap) {
            Transaction transaction = await Transaction.fromMap(map);
            _transaction.add(transaction);
          }
        }

        notifyListeners();
      }
    }
  }
}
