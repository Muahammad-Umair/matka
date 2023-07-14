import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/routes.dart';

class DepositMethodSelect extends StatelessWidget {
  const DepositMethodSelect({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Deposit Setup",
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FlipInX(
              duration: Duration(seconds: 2),
              child: Container(
                // height: 100,
                width: size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(
                        -1,
                        -1,
                      ),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(
                        1,
                        1,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.addbalanceScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Add Manually",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(Assets.imagesArrrowSide),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlipInX(
              duration: Duration(seconds: 2),
              child: Container(
                // height: 100,
                width: size.width,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(
                        -1,
                        -1,
                      ),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(
                        1,
                        1,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.depositUpiScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Upi Gateway",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(Assets.imagesArrrowSide),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
    );
  }
}
