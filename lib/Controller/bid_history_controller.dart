import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Model/bid_history.dart';
import 'package:matka/Utilies/constant.dart';

import '../Utilies/Widget/snackbar.dart';

class BidHistoryController extends ChangeNotifier {
  List<BidHistory> _todaybidlist = [];
  List<BidHistory> _oldbidlist = [];

  List<BidHistory> get todaybidlist => [..._todaybidlist];
  List<BidHistory> get oldbidlist => [..._oldbidlist];

  Future<bool> fetchBidDetail(BuildContext context) async {
    try {
      final url = Uri.parse(Api.bidHistory);
      String token = await sharedPreferences.getString('token').toString();
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
          _todaybidlist = [];
          _oldbidlist = [];
          final datalist = await decodedData['data'];
          if (datalist != null) {
            final currentDate =
                DateTime.now().toIso8601String().substring(0, 10);
            for (var map in datalist) {
              String date = map['time'];
              date = date.substring(0, 10);
              if (date == currentDate) {
                final item = map as Map<String, dynamic>;
                BidHistory bid = BidHistory.fromMap(item);
                _todaybidlist.add(bid);
              } else {
                final item = map as Map<String, dynamic>;
                BidHistory bid = BidHistory.fromMap(item);
                _oldbidlist.add(bid);
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
      showSnackBar(
          context: context, message: e.toString(), error: true, time: 1);
      return false;
    }
  }

  List<BidHistory> todayfindBytype(String type) {
    return _todaybidlist.where((bid) => bid.gameType == type).toList();
  }

  List<BidHistory> oldfindBytype(String type) {
    return _oldbidlist.where((bid) => bid.gameType == type).toList();
  }
}
