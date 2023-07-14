import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:matka/Constant/notification_services.dart';
import 'package:matka/Controller/balance_controller.dart';
import 'package:matka/Controller/bid_history_controller.dart';
import 'package:matka/Controller/crouse_imageText_Controller.dart';
import 'package:matka/Controller/gameCategories_controller.dart';
import 'package:matka/Controller/game_result_controller.dart';
import 'package:matka/Controller/game_rules_controller.dart';
import 'package:matka/Controller/games_controller.dart';
import 'package:matka/Controller/internet_connectivity.dart';
import 'package:matka/Controller/navcontroller.dart';
import 'package:matka/Controller/refer_history_controller.dart';
import 'package:matka/Controller/withdraw_history_controller.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool islogin = false;
Future<void> initDatabase() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initDatabase();
  islogin = await sharedPreferences.getBool('islogin') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageTextController(),
        ),
        ChangeNotifierProvider.value(
          value: InternetConnectivityP(),
        ),
        ChangeNotifierProvider.value(
          value: GamesCategoryController(),
        ),
        ChangeNotifierProvider.value(
          value: GamesController(),
        ),
        ChangeNotifierProvider.value(
          value: BalanceController(),
        ),
        ChangeNotifierProvider.value(
          value: GameResultController(),
        ),
        ChangeNotifierProvider.value(
          value: BidHistoryController(),
        ),
        ChangeNotifierProvider.value(
          value: WithdrawHistoryC(),
        ),
        ChangeNotifierProvider.value(
          value: DepositHistoryC(),
        ),
        ChangeNotifierProvider.value(
          value: RulesController(),
        ),
        ChangeNotifierProvider.value(
          value: ReferHistoryController(),
        ),
      ],
      child: MaterialApp(
        title: "Tiger Casino",
        color: Materialcolor.thirdColor,
        debugShowCheckedModeBanner: false,
        initialRoute: islogin ? Routes.navScreen : Routes.authScreen,
        // initialRoute: Routes.withdrawSetupScreen,
        // initialRoute: Routes.depositSelectionScreen,
        routes: MaterialRoute.routes(),
      ),
    );
  }
}
