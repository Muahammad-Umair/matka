import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/game_result_controller.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  int id;
  ResultScreen({required this.id});
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("here is id ${widget.id}");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Result Screen",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: size.height * 0.07,
                width: size.width,
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Materialcolor.appbarColor,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: "Single/Patti",
                        elevation: 0,
                        fontsize: 16,
                        radius: 6,
                        color: index == 0 ? Materialcolor.buttonColor : null,
                        ontap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CustomButton(
                          title: "Cp/Jodi",
                          fontsize: 16,
                          elevation: 0,
                          radius: 6,
                          color: index == 1 ? Materialcolor.buttonColor : null,
                          ontap: () {
                            setState(() {
                              index = 1;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomResultCard1(id: widget.id, indx: index),
              SizedBox(
                height: 20,
              ),
              CustomResultCard2(id: widget.id, indx: index),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomResultCard1 extends StatelessWidget {
  int id;
  int indx;
  CustomResultCard1({super.key, required this.id, required this.indx});

  @override
  Widget build(BuildContext context) {
    print("I am agan build with index number $indx++++++++++++++++++++++");

    return FutureBuilder(
      future: fetchData(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoadingWidget();
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error, context);
        } else {
          return buildDataWidget(context, indx);
        }
      },
    );
  }

  Future<void> fetchData(BuildContext context) async {
    final gamesController = Provider.of<GameResultController>(
      context,
      listen: false,
    );
    await gamesController.fetchResult(id, context);
  }

  Widget buildLoadingWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "TODAY RESULT",
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
    );
  }

  Widget buildErrorWidget(dynamic error, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "TODAY RESULT",
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
    );
  }

  Widget buildDataWidget(BuildContext context, int indx) {
    final todaylist = Provider.of<GameResultController>(context).todayresultL;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "TODAY RESULT",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: todaylist.isEmpty
              ? Column(
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
                      "No data found",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              : GridView.builder(
                  itemCount: todaylist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 9 / 12,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 14),
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // width: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Materialcolor.buttonColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                )),

                            child: Center(
                              child: Text(
                                todaylist[index].gameName,
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          Container(
                            // width: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),

                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade400,
                                  ],
                                ),
                                color: Materialcolor.buttonColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    indx == 0
                                        ? todaylist[index].single.isEmpty
                                            ? "N/A"
                                            : todaylist[index].single
                                        : todaylist[index].jodi.isEmpty
                                            ? "N/A"
                                            : todaylist[index].jodi,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.2,
                                    ),
                                  ),
                                  Text(
                                    indx == 1
                                        ? todaylist[index].patti.isEmpty
                                            ? "N/A"
                                            : todaylist[index].patti
                                        : todaylist[index].cp.isEmpty
                                            ? "N/A"
                                            : todaylist[index].cp,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}

class CustomResultCard2 extends StatelessWidget {
  int id;
  int indx;
  CustomResultCard2({super.key, required this.id, required this.indx});

  @override
  Widget build(BuildContext context) {
    print("I am agan build with index number $indx++++++++++++++++++++++");

    return FutureBuilder(
      future: fetchData(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return buildLoadingWidget();
        } else if (snapshot.hasError) {
          return buildErrorWidget(snapshot.error, context);
        } else {
          return buildDataWidget(context, indx);
        }
      },
    );
  }

  Future<void> fetchData(BuildContext context) async {
    final gamesController = Provider.of<GameResultController>(
      context,
      listen: false,
    );
    await gamesController.fetchResult(id, context);
  }

  Widget buildLoadingWidget() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "OLD RESULT",
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
    );
  }

  Widget buildErrorWidget(dynamic error, BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "OLD RESULT",
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
    );
  }

  Widget buildDataWidget(BuildContext context, int indx) {
    final todaylist = Provider.of<GameResultController>(context).otherresultL;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          margin: EdgeInsets.symmetric(horizontal: 4),
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
              "OLD RESULT",
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: todaylist.isEmpty
              ? Column(
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
                      "No data found",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              : GridView.builder(
                  itemCount: todaylist.length,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 9 / 12,
                      mainAxisSpacing: 7,
                      crossAxisSpacing: 14),
                  itemBuilder: (context, index) {
                    print(
                        'Here is jodi number ${index == 0 ? todaylist.first.single : todaylist.first.single} ======================');
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            // width: 80,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Materialcolor.buttonColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                )),

                            child: Center(
                              child: Text(
                                todaylist[index].gameName,
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                          Container(
                            // width: 100,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),

                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade400,
                                  ],
                                ),
                                color: Materialcolor.buttonColor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                )),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    indx == 0
                                        ? todaylist[index].single.isEmpty
                                            ? "N/A"
                                            : todaylist[index].single
                                        : todaylist[index].jodi.isEmpty
                                            ? "N/A"
                                            : todaylist[index].jodi,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                  SizedBox(
                                    width: 60,
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.2,
                                    ),
                                  ),
                                  Text(
                                    indx == 1
                                        ? todaylist[index].patti.isEmpty
                                            ? "N/A"
                                            : todaylist[index].patti
                                        : todaylist[index].cp.isEmpty
                                            ? "N/A"
                                            : todaylist[index].cp,
                                    maxLines: 1,
                                    overflow: TextOverflow.fade,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}
