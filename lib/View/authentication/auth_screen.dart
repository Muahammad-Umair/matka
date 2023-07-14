import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesImageAuth),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesImageBlue),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BounceInLeft(
              child: Container(
                margin: const EdgeInsets.all(authbuttonradius),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: GoogleFonts.cairo(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: welcomefontSize,
                          ),
                        ),
                      ),
                      Text(
                        "Tiger Casino.io",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: welcomefontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Earn by playing with you luck",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      SlideInLeft(
                        delay: const Duration(milliseconds: 300),
                        child: CustomButton(
                          ontap: () {
                            Navigator.pushNamed(context, Routes.signupScreen);
                          },
                          title: "Sign Up",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      SlideInRight(
                        delay: const Duration(milliseconds: 300),
                        child: CustomButton(
                          ontap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.signinScreen);
                          },
                          title: "Sign In",
                          color: const Color(0xff3C9BFC),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
