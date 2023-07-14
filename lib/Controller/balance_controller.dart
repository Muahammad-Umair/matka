import 'package:flutter/cupertino.dart';

class BalanceController extends ChangeNotifier {
  String _balance = "0";

  String get balnace => _balance;

  setBalance(String balance) {
    _balance = "0";
    _balance = balance;
    notifyListeners();
  }
}
