import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          centerTitle: true,
          title: "Refer & Earn",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
                image: const DecorationImage(
                  image: AssetImage(Assets.imagesEarn),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                children: [
                  Text(
                    "Refer your friends and earn unlimited cash",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    "For every friends that plays, you get 2% of this total game account for maximum Rs. 1000 per referal",
                    style: GoogleFonts.lato(fontSize: 14),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: const Text("HOW IT WORKS"),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {
                  //         // Navigator.of(context).pushNamed()
                  //       },
                  //       child: const Text("REFER RULES"),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.2,
                    width: size.width,
                    // margin: EdgeInsets.symmetric(horizontal: size.width),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 0,
                          offset: const Offset(1, 1),
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(-1, -1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "SHARE YOUR INVITE CODE",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                const Spacer(),
                                Text(sharedPreferences
                                    .getString('reference')
                                    .toString()),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomButton(
                            elevation: 0,
                            title: "WHATSAPP SHARE",
                            color: Materialcolor.buttonColor,
                            ontap: () async {
                              final String text =
                                  'i just got Rs.100 as bonus to play all games so sharing the same with you.Tap https://ffstars.in/ to download the app and use my refer code ${sharedPreferences.getString("reference")} to get Bonus of Rs. 100!!';

                              const phoneNumber =
                                  '+923023147342'; // Replace with the desired phone number

                              var url = "whatsapp://send?phone=$phoneNumber" +
                                  "&text=${Uri.encodeComponent(text)}";

                              try {
                                await launchUrl(Uri.parse(url));
                              } catch (e) {
                                print(e);
                                showSnackBar(
                                    context: context,
                                    message: e.toString(),
                                    error: true);
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
