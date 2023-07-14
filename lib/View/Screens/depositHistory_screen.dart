import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/withdraw_history_controller.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class DepositHistroyScreen extends StatelessWidget {
  DepositHistroyScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: 'Deposit History',
        ),
      ),
      body: FutureBuilder<void>(
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
      ),
    );
  }

  Future<void> fetchData(BuildContext context) async {
    final controller = Provider.of<DepositHistoryC>(
      context,
      listen: false,
    );
    await controller.fetchTransaction();
  }

  Widget buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                "DEPOSIT TRANSACTION'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Transaction',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Mode',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
                "DEPOSIT TRANSACTION'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Transaction',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Mode',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
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
    final gamesController = Provider.of<DepositHistoryC>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
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
                "DEPOSIT TRANSACTION'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: gamesController.transaction.isEmpty ? 0 : 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    'Transaction',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Amount',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Mode',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Status',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: gamesController.transaction.isEmpty
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
                    : gamesController.transaction
                        .map(
                          (game) => FlipInX(
                            duration: Duration(seconds: 2),
                            child: Container(
                              margin: EdgeInsets.all(6),
                              padding: EdgeInsets.symmetric(horizontal: 8),
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
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          game.number,
                                          style: GoogleFonts.cairo(
                                            fontSize: 14,
                                            color:
                                                Materialcolor.appbarTitleColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          game.createDate.isNotEmpty
                                              ? game.createDate.substring(0, 10)
                                              : game.createDate,
                                          textScaleFactor: 1,
                                          style: GoogleFonts.cairo(
                                            fontSize: 12,
                                            color:
                                                Materialcolor.appbarTitleColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        game.amount,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(game.type),
                                  ),
                                  Expanded(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color:
                                            game.transactionStatus == 'failed'
                                                ? Colors.red
                                                : game.transactionStatus ==
                                                        'pending'
                                                    ? Colors.yellow
                                                    : Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          game.transactionStatus,
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
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
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
