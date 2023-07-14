import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/generated/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

const double toolBarHeight = 60;

Widget logotitle = Pulse(
  child: Align(
    child: Text(
      "Tiger Casino",
      style: GoogleFonts.lato(
        fontSize: 25,
        color: Materialcolor.buttonColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
);

//font size
const double authbuttonradius = 20;
const double welcomefontSize = 27;
const double labelfontSize = 14;

//color
Color textfieldlabelColor = Materialcolor.greyColor.shade600;

//local database

late SharedPreferences sharedPreferences;
// String token = '';

// class OfflineDatebase {
//   static int id = sharedPreferences.getInt('userId') ?? -1;
//   static String name = sharedPreferences.getString('name') ?? '';
//   static String phone = sharedPreferences.getString('phone') ?? '';
//   static String token = sharedPreferences.getString('token') ?? '';
//   static String image = sharedPreferences.getString('image') ?? '';
//   static String reference = sharedPreferences.getString('reference') ?? '';
//   static bool islogin = sharedPreferences.getBool('islogin') ?? false;
// }
