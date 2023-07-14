import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:matka/Model/api.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/constant.dart';
//used to return the error.
// Future<String> ReturnError(Map<String,dynamic> error){
//

// }

class Auth {
  static Future<bool> signUp({
    required String name,
    required String phone,
    String? referenceId,
    required String password,
    required String Cpassword,
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(Api.register);
      final FirebaseMessaging _fcm = await FirebaseMessaging.instance;
      final fcmtoken = await _fcm.getToken();
      http.Response response = await http.post(
        url,
        body: {
          "first_name": name,
          "phone_number": phone,
          "password": password,
          "password_confirmation": Cpassword,
          'fcm_token': fcmtoken,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);

        var status = await body['status'];

        if (status) {
          //assign the value of variable
          String token = await body['data']['token'];
          final user = await body['data']['user'];
          int usrId = await user['id'];
          String name = await user['first_name'];
          String image = await user['profile_image'] ?? '';
          String reference = await user['reference_id'] ?? '';
          String phone = await user['phone_number'];

          // store the value
          await sharedPreferences.setString('name', name);
          await sharedPreferences.setString('phone', phone);
          await sharedPreferences.setString('token', token);
          await sharedPreferences.setInt("userId", usrId);
          await sharedPreferences.setString('reference', reference);
          await sharedPreferences.setString("image", image);
          await sharedPreferences.setBool("islogin", true);

          return true;
        } else {
          Map<String, dynamic> errors = await body["errors"];
          if (errors.containsKey('phone_number')) {
            throw await errors['phone_number'];
          } else if (errors.containsKey('password')) {
            throw await errors['password'];
          }
          throw body['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<String> signIn({
    required String number,
    required String password,
    required BuildContext context,
  }) async {
    try {
      Uri url = Uri.parse(Api.signIn);

      http.Response response = await http.post(url, body: {
        "phone_number": number,
        "password": password,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        bool status = await body['status'];

        if (status) {
          //assign the value of variable
          String token = await body['data']['token'];
          var user = await body['data']['user'] ?? null;
          await sharedPreferences.setString('token', token);
          if (user != null) {
            int usrId = await user['id'];
            String name = await user['first_name'];
            String phone = await user['phone_number'];
            String image = await user['profile_image'] ?? '';
            String reference = await user['reference_id'] ?? '';

            await sharedPreferences.setString('name', name);
            await sharedPreferences.setString('phone', phone);

            await sharedPreferences.setInt("userId", usrId);
            await sharedPreferences.setString("image", image);
            await sharedPreferences.setBool("islogin", true);
            await sharedPreferences.setString('reference', reference);
            return "true";
          } else {
            return "false";
          }

          // store the value
        } else if (body['messages'] == "The given data was invalid") {
          throw body['messages'];
        } else if (body['errors']['error'] == "verify_otp") {
          await sharedPreferences.setInt(
              'userId', await body['errors']['user_id']);
          return body['messages'];
        } else {
          throw body['messages'];
        }
      } else {
        throw "Something went wrong";
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return "false";
    }
  }

  static Future<bool> verifyOtp({
    required String otp,
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(Api.verifyotpApi);
      int userId = await sharedPreferences.getInt('userId') ?? -1;

      http.Response response = await http.post(
        url,
        body: {
          "otp": otp,
          "user_id": userId.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        bool status = await body['status'];

        if (status) {
          await sharedPreferences.setBool('islogIn', true);
          showSnackBar(context: context, message: "Otp successfully verified");
          return true;
        } else {
          throw body['messages'];
        }
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> resendOtp({
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(Api.resendotpApi);
      final userId = await sharedPreferences.getInt('userId') ?? -1;

      http.Response response = await http.post(
        url,
        body: {
          'user_id': userId.toString(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        bool status = await body['status'];

        if (status) {
          showSnackBar(context: context, message: "Otp send successfully");
          return true;
        } else {
          throw body['messages'];
        }
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      print(e);
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> resetPassword({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    try {
      final url = Uri.parse(Api.resetPassword);

      http.Response response = await http.post(
        url,
        body: {
          'phone_number': phoneNumber,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        bool status = await body['status'];

        if (status) {
          showSnackBar(context: context, message: "Otp send successfully");
          return true;
        } else {
          throw body['messages'];
        }
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }

  static Future<bool> resetupdatePassword({
    required String otp,
    required String password,
    required BuildContext context,
  }) async {
    bool _isError = false;

    try {
      final url = Uri.parse(Api.resetPassword);

      http.Response response = await http.post(
        url,
        body: {
          'otp': otp,
          'password': password,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        bool status = await body['status'];

        if (status) {
          showSnackBar(
              context: context, message: "password reset successfully");
          return true;
        } else {
          throw body['messages'];
        }
      } else {
        throw 'Something went wrong';
      }
    } catch (e) {
      showSnackBar(context: context, message: e.toString(), error: true);
      return false;
    }
  }
}
