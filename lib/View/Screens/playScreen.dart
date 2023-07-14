import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/game.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/View/Screens/submit_screen.dart';
import 'package:matka/generated/assets.dart';

class PlayScreen extends StatelessWidget {
  final Game game;
  const PlayScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: game.name,
          centerTitle: true,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitScreen(
                            type: "single",
                            game: game,
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          Assets.imagesDices1,
                        ))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "SINGLE",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset(Assets.imagesArrrowSide)),
                      SizedBox(
                        width: 5,
                      )
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitScreen(
                            type: "patti",
                            game: game,
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          Assets.imagesPokerCards,
                        ))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "PATTI",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitScreen(
                            type: "joddi",
                            game: game,
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          Assets.imagesJodi,
                        ))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "JODI",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubmitScreen(
                            type: "cp",
                            game: game,
                          ),
                        ));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                          Assets.imagesDice2,
                        ))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "CP PATTI",
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
