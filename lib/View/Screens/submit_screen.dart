import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:matka/Model/game.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key, required this.type, required this.game});
  final String type;
  final Game game;
  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  late TextEditingController digitC;
  late TextEditingController amountC;

  @override
  void initState() {
    digitC = TextEditingController();
    amountC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    digitC.dispose();
    amountC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: widget.type,
          centerTitle: true,
        ),
      ),
      body: Column(
        children: [
          CountdownTimerWidget(endTime: widget.game.end_time),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SlideInLeft(
                            child: CustomTextField(
                              controller: digitC,
                              hintText: "Enter digit",
                              keyboadType: TextInputType.number,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SlideInRight(
                            child: CustomTextField(
                              controller: amountC,
                              hintText: "Enter amount",
                              keyboadType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SlideInUp(
              child: CustomButton(
                ontap: () async {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  bool status = await ApiService.submitBid(
                      context: context,
                      gameId: widget.game.id,
                      gameType: widget.type,
                      digit: digitC.text,
                      amount: amountC.text);
                  if (status) {
                    await ApiService.checkbalance(context);
                    digitC.clear();
                    amountC.clear();
                    showSnackBar(
                        context: context, message: "Bid submit successfully");
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  } else {
                    Navigator.of(context).pop();

                    FocusScope.of(context).unfocus();
                  }
                },
                title: "Submit",
                color: Colors.lightBlue,
                radius: 10,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CountdownTimerWidget extends StatefulWidget {
  final String endTime;

  CountdownTimerWidget({required this.endTime});

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Timer timer;
  late DateTime endTime;
  String remainingTimeString = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    List<String> timeParts = widget.endTime.split(':');
    DateTime now = DateTime.now();
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    endTime = DateTime(now.year, now.month, now.day, hour, minute);

    // Calculate the initial remaining duration
    Duration remainingDuration = endTime.difference(now);
    updateRemainingTime(remainingDuration);

    // Start a timer that updates the remaining time every second
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      Duration remainingDuration = endTime.difference(DateTime.now());
      updateRemainingTime(remainingDuration);
    });
  }

  void updateRemainingTime(Duration remainingDuration) {
    setState(() {
      int remainingHours = remainingDuration.inHours;
      int remainingMinutes = remainingDuration.inMinutes.remainder(60);
      int remainingSeconds = remainingDuration.inSeconds.remainder(60);
      remainingTimeString =
          '${remainingHours}h : ${remainingMinutes}m : ${remainingSeconds}s';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Bids closed-in"),
              Text(
                remainingTimeString,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
