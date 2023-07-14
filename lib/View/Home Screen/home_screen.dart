import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:matka/Controller/crouse_imageText_Controller.dart';
import 'package:matka/Controller/gameCategories_controller.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/custom_6button.dart';
import 'package:matka/Utilies/Widget/custom_crousel.dart';
import 'package:matka/Utilies/Widget/custom_main_category.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirstTime = true;

  int counter = 0;

  @override
  void initState() {
    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = context.read<GamesCategoryController>();
    final textImageController = context.read<ImageTextController>();
    textImageController.fethcSliderImageText();
    controller.fetchCatergories(context);
    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetchCatergories(context);
        await ApiService.checkbalance(context);
        await textImageController.fethcSliderImageText();
      },
      child: Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        color: Materialcolor.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomCrousel(),
              SizedBox(
                height: 10,
              ),
              const CustomButtonContainer(),
              SizedBox(
                height: 10,
              ),
              CustomCategoryGames()
            ],
          ),
        ),
      ),
    );
  }
}
