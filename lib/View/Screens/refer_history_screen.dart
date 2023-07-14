import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/refer_history_controller.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class ReferHistoryScreen extends StatelessWidget {
  const ReferHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Refer History",
          centerTitle: true,
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
    final controller = Provider.of<ReferHistoryController>(
      context,
      listen: false,
    );
    await controller.fetchRefer();
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
                "REFERAL HISTORY'S",
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
                "REFERAL HISTORY'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
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
    final controller = Provider.of<ReferHistoryController>(
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
                "REFERAL HISTORY'S",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: controller.referHistoryList.isEmpty ? 0 : 5),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: controller.referHistoryList.isEmpty
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
                    : controller.referHistoryList
                        .map(
                          (refer) => FlipInX(
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
                              child: Column(
                                children: [
                                  Text(
                                    refer.name,
                                    style: GoogleFonts.cairo(
                                      fontSize: 12,
                                      color: Materialcolor.appbarTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    refer.number,
                                    style: GoogleFonts.cairo(
                                      fontSize: 12,
                                      color: Materialcolor.appbarTitleColor,
                                      fontWeight: FontWeight.bold,
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
