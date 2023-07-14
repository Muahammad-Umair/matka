import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Controller/balance_controller.dart';
import 'package:matka/Model/api.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utilies/constant.dart';

class ApiService {
  static Future<bool> submitBid({
    required BuildContext context,
    required int gameId,
    required String gameType,
    required String digit,
    required String amount,
  }) async {
    try {
      final url = Uri.parse(Api.submitBid);
      String token = sharedPreferences.getString('token').toString();
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "game_id": gameId.toString(),
          "game_type": gameType,
          "digit": digit,
          "amount": amount,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        bool status = decodedData['status'];
        if (status) {
          return true;
        } else {
          throw decodedData['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> updateNameImage({
    required BuildContext context,
    required String imagebase64,
    required String name,
  }) async {
    try {
      final url = Uri.parse(Api.updateNameImage);
      String token = await sharedPreferences.getString('token').toString();
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "profile_image": imagebase64,
          "name": name,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        bool status = decodedData['status'];
        if (status) {
          var data = decodedData['data'];
          print("Here is image data $data");
          if (data != null) {
            String name = data['first_name'];
            String phone = data['phone_number'];
            String image = data['profile_image'];
            await sharedPreferences.setString('name', name);
            await sharedPreferences.setString('phone', phone);
            await sharedPreferences.setString('image', image);
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
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> updatePassword({
    required BuildContext context,
    required String oldpassword,
    required String newpassword,
  }) async {
    try {
      final url = Uri.parse(Api.updatePassword);
      String token = await sharedPreferences.getString('token').toString();
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "old_password": oldpassword,
          "new_password": newpassword,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        bool status = decodedData['status'] ?? false;
        if (status) {
          showSnackBar(
              context: context, message: "Password update successfully");
          return true;
        } else {
          throw decodedData['messages'];
        }
      } else {
        // throw "Something went wrong";
        throw response.statusCode;
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> updateWithdraw({
    required BuildContext context,
    String bankName = '',
    String beneficiaryName = '',
    String bankAccountNo = '',
    String bankIfscCode = '',
    String bhimAddress = '',
    String paytmAddress = '',
    String phonepayAddress = '',
  }) async {
    try {
      final url = Uri.parse(Api.updatePaymentMethod);
      String token = await sharedPreferences.getString('token').toString();
      http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          "bank_name": bankName,
          "beneficiary_name": beneficiaryName,
          "bank_account_no": bankAccountNo,
          "bank_ifsc_code": bankIfscCode,
          "bhim_address": bhimAddress,
          "paytm_address": paytmAddress,
          "phonepay_address": phonepayAddress,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = jsonDecode(response.body);
        bool status = decodedData['status'] ?? false;
        if (status) {
          showSnackBar(
              context: context, message: "Account update successfully");
          return true;
        } else {
          throw decodedData['messages'];
        }
      } else {
        // throw "Something went wrong";
        throw response.statusCode;
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<void> checkbalance(BuildContext context) async {
    String token = sharedPreferences.getString('token') ?? "";
    print(
        "Check api is caling again and again==========1!!!!!!!!!!!!!!!!!!!!!!!======");
    final url = Uri.parse(Api.checkBalance);
    http.Response response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedData = await jsonDecode(response.body);
      bool status = await decodedData['status'];

      if (status) {
        final controller = context.read<BalanceController>();
        final balance = await decodedData['data']["balance"];
        await controller.setBalance(balance.toString());
      }
    }
  }

  static Future<bool> addamount(
      {required String transactionId,
      required String amount,
      required String mode,
      required BuildContext context}) async {
    try {
      final url = Uri.parse(Api.addBalance);

      final tokenNew = await sharedPreferences.getString("token");
      http.Response response = await http.post(
        url,
        body: {
          'transection_id': transactionId,
          'amount': amount,
          "mode": mode,
        },
        headers: {
          'Authorization': 'Bearer $tokenNew',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = await jsonDecode(response.body);
        bool status = await decodedData['status'];

        if (status) {
          showSnackBar(context: context, message: "Submit successfully");
          return true;
        } else {
          throw decodedData['message'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> addUpiAmount(
      {required String amount, required BuildContext context}) async {
    try {
      final url = Uri.parse(Api.addupibalance);
      // todo this will remove
      final tokenNew = await sharedPreferences.getString("token");
      http.Response response = await http.post(
        url,
        body: {
          "amount": amount,
        },
        headers: {
          'Authorization': 'Bearer $tokenNew',
        },
      );
      print("${response.statusCode} +-=-==-===-=-=-=--=-=-=-=-=-=-=-");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedData = await jsonDecode(response.body);
        bool status = await decodedData['status'];

        if (status) {
          final data = decodedData['data'];
          int orderId = await data['order_id'];
          String paymentUrl = await data['payment_url'];
          sharedPreferences.setInt("orderId", orderId);
          sharedPreferences.setString("paymentUrl", paymentUrl);
          return true;
        } else {
          print("Here is data");
          throw decodedData['msg'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> withdrawAmount(
      {required String accountNumber,
      required String amount,
      required String mode,
      required String number,
      required BuildContext context}) async {
    // try {
    final url = Uri.parse(Api.withdrawBalance);

    final tokenNew = await sharedPreferences.getString("token");
    http.Response response = await http.post(
      url,
      body: {
        'account_number': accountNumber,
        'phone_number': number,
        'amount': amount,
        "mode": mode,
      },
      headers: {
        'Authorization': 'Bearer $tokenNew',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final decodedData = await jsonDecode(response.body);
      bool status = await decodedData['status'];

      if (status) {
        showSnackBar(
            context: context, message: "Success, It will be processed soon.");
        return true;
      } else {
        throw decodedData['message'];
      }
    } else {
      throw "Something went wrong";
    }
    // } catch (e) {
    //   showSnackBar(context: context, message: e.toString(), error: true);
    //   return false;
    // }
  }

  static Future<bool> termlunch(BuildContext context, String urlp) async {
    final url = Uri.parse(urlp);
    bool back = false;
    try {
      if (await canLaunchUrl(url)) {
        back = await launchUrl(url, mode: LaunchMode.platformDefault);
        return back;
      } else {
        throw "Cannot lunch at this time";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  // this will fetch the slider images and text;
}
