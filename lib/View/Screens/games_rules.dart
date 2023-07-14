import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/game_rules_controller.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class GamesRulesScreen extends StatelessWidget {
  const GamesRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Game Rules",
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder<void>(
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
          ],
        ),
      ),
    );
  }

  Future<void> fetchData(BuildContext context) async {
    final controller = Provider.of<RulesController>(
      context,
      listen: false,
    );
    await controller.fetchRules();
  }

  Widget buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                "RULE'S",
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                "RULE'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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
    final rules = Provider.of<RulesController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                "RULE'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 20),
            child: Column(
              children: rules.rulesText.isEmpty
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
                  : rules.rulesText
                      .map((ruletext) => Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(40)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ruletext,
                                style: GoogleFonts.lato(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                            ],
                          ))
                      .toList(),
            ),
          )
        ],
      ),
    );
  }
}
