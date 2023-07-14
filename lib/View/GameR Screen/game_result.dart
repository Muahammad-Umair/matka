import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/gameCategories_controller.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/View/Screens/result_screen.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class CustomCatagoryResult extends StatelessWidget {
  CustomCatagoryResult({Key? key}) : super(key: key);
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetchData(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoadingWidget();
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error, context);
        } else {
          return buildDataWidget(context);
        }
      },
    );
  }

  Future<void> fetchData(BuildContext context) async {
    final gamesController = Provider.of<GamesCategoryController>(
      context,
      listen: false,
    );
    await gamesController.fetchCatergories(context);
  }

  Widget buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: Materialcolor.thirdColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            width: double.infinity,
            child: Center(
              child: Text(
                "RESULT",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Center(child: CircularProgressIndicator()),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildErrorWidget(dynamic error, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: Materialcolor.thirdColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            width: double.infinity,
            child: Center(
              child: Text(
                "RESULLT",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesNoData),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            "Error: $error",
            style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildDataWidget(BuildContext context) {
    final gamesController = Provider.of<GamesCategoryController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: Materialcolor.thirdColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            child: Center(
              child: Text(
                "RESULTS",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              child: SingleChildScrollView(
                child: Column(
                  children: gamesController.game.isEmpty
                      ? [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(Assets.imagesNoData),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            "No data found",
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ]
                      : gamesController.game
                          .map(
                            (game) => FlipInX(
                              duration: Duration(seconds: 2),
                              child: Container(
                                margin: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(-1, -1)),
                                    BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(1, 1)),
                                  ],
                                  color: Colors.grey.shade300,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 0)
                                          .copyWith(bottom: 0),
                                      child: Text(
                                        game.title,
                                        textScaleFactor: 1.1,
                                        style: GoogleFonts.cairo(
                                          fontSize: 16,
                                          color: Materialcolor.appbarTitleColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                        vertical: 0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.145,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                game.image,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.32,
                                              child: Text(
                                                game.name,
                                                overflow: TextOverflow.fade,
                                                maxLines: 2,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.cairo(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Materialcolor
                                                      .appbarTitleColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.050,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.29,
                                            child: CustomButton(
                                              color: Materialcolor.buttonColor,
                                              radius: 8,
                                              elevation: 2,
                                              fontsize: 14,
                                              title: "View",
                                              ontap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ResultScreen(
                                                        id: game.id,
                                                      ),
                                                    ));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
