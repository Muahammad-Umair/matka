import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/bid_history_controller.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class BidHistoryresultScreen extends StatefulWidget {
  @override
  State<BidHistoryresultScreen> createState() => _BidHistoryresultScreenState();
}

class _BidHistoryresultScreenState extends State<BidHistoryresultScreen> {
  int index = 0;
  String selected = 'single';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 30,
        ),
        Container(
          // height: size.height * 0.07,
          width: size.width,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(1, 1),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(-1, -1),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Single",
                      elevation: 0,
                      fontsize: 16,
                      radius: 6,
                      color: index == 0 ? Materialcolor.buttonColor : null,
                      ontap: () {
                        setState(() {
                          index = 0;
                        });
                        selected = 'single';
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                        title: "Patti",
                        fontsize: 16,
                        elevation: 0,
                        radius: 6,
                        color: index == 1 ? Materialcolor.buttonColor : null,
                        ontap: () {
                          setState(() {
                            index = 1;
                          });
                          selected = 'patti';
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: "Cp Patti",
                      elevation: 0,
                      fontsize: 16,
                      radius: 6,
                      color: index == 2 ? Materialcolor.buttonColor : null,
                      ontap: () {
                        setState(() {
                          index = 2;
                        });
                        selected = 'cp patti';
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomButton(
                        title: "Joddi",
                        fontsize: 16,
                        elevation: 0,
                        radius: 6,
                        color: index == 3 ? Materialcolor.buttonColor : null,
                        ontap: () {
                          setState(() {
                            index = 3;
                          });
                          selected = 'jodi';
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Materialcolor.thirdColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "TODAY BID'S",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                          .copyWith(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Game',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Number',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Amount',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Result',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BidHistoryDetail1(
                  type: selected,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                    color: Materialcolor.thirdColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "OLD BID'S",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                          .copyWith(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Game',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Number',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Amount',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Result',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BidHistoryDetail2(
                  type: selected,
                )
              ],
            ),
          ),
        )),
      ],
    );
  }
}

class BidHistoryDetail1 extends StatelessWidget {
  const BidHistoryDetail1({Key? key, this.type = 'single'}) : super(key: key);
  final String type;

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
    final gamesController = Provider.of<BidHistoryController>(
      context,
      listen: false,
    );
    await gamesController.fetchBidDetail(context);
  }

  Widget buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(child: CircularProgressIndicator()),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildErrorWidget(dynamic error, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
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
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildDataWidget(BuildContext context) {
    final list =
        Provider.of<BidHistoryController>(context).todayfindBytype(type);
    print('here is list of bid history');
    return Container(
      margin: EdgeInsets.all(10).copyWith(right: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: list.isEmpty
                ? [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
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
                    SizedBox(
                      height: 4,
                    ),
                  ]
                : list.map(
                    (game) {
                      return FlipInX(
                        duration: Duration(seconds: 2),
                        child: Container(
                          // margin: EdgeInsets.all(6),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(10),
                            //   topRight: Radius.circular(10),
                            // ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-1, -1)),
                              BoxShadow(
                                  color: Colors.black12, offset: Offset(1, 1)),
                            ],
                            color: game.win == "Loose"
                                ? Colors.red
                                : game.win == "Win"
                                    ? Colors.green
                                    : Colors.yellow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  game.time,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.gameName,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.digit,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.amount,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.win,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
          ),
        ),
      ),
    );
  }
}

class BidHistoryDetail2 extends StatelessWidget {
  const BidHistoryDetail2({Key? key, this.type = 'single'}) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("I am buildin again in bid history detail++++++++++++++++++");
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
    final gamesController = Provider.of<BidHistoryController>(
      context,
      listen: false,
    );
    await gamesController.fetchBidDetail(context);
  }

  Widget buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(child: CircularProgressIndicator()),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buildErrorWidget(dynamic error, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
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
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildDataWidget(BuildContext context) {
    final list = Provider.of<BidHistoryController>(context)
        .oldfindBytype(type.toUpperCase());
    print('here is list of bid history');
    return Container(
      margin: EdgeInsets.all(10).copyWith(right: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: list.isEmpty
                ? [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
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
                : list.map(
                    (game) {
                      return FlipInX(
                        duration: Duration(seconds: 2),
                        child: Container(
                          // margin: EdgeInsets.all(6),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(10),
                            //   topRight: Radius.circular(10),
                            // ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-1, -1)),
                              BoxShadow(
                                  color: Colors.black12, offset: Offset(1, 1)),
                            ],
                            color: game.win == "Loose"
                                ? Colors.red
                                : game.win == "Win"
                                    ? Colors.green
                                    : Colors.yellow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  game.time,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.gameName,
                                  style: GoogleFonts.cairo(
                                    fontSize: 10,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.digit,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.amount,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  game.win,
                                  style: GoogleFonts.cairo(
                                    fontSize: 12,
                                    color: Materialcolor.appbarTitleColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
          ),
        ),
      ),
    );
  }
}
