import 'package:flutter/material.dart';
import 'package:matka/View/NavBar/navbar.dart';
import 'package:matka/View/Screens/Add%20Balance/add_balance.dart';
import 'package:matka/View/Screens/Add%20Balance/add_upibalance.dart';
import 'package:matka/View/Screens/Add%20Balance/method_selection_screen.dart';
import 'package:matka/View/Screens/account_update.dart';
import 'package:matka/View/Screens/depositHistory_screen.dart';
import 'package:matka/View/Screens/games_rules.dart';
import 'package:matka/View/Screens/games_timing.dart';
import 'package:matka/View/Screens/refer_earn_screen.dart';
import 'package:matka/View/Screens/refer_history_screen.dart';
import 'package:matka/View/Screens/withdraw%20Setup/bank_account_setup.dart';
import 'package:matka/View/Screens/withdraw%20Setup/google_pey_setup.dart';
import 'package:matka/View/Screens/withdraw%20Setup/paytm_setup.dart';
import 'package:matka/View/Screens/withdraw%20Setup/phonepe_setup.dart';
import 'package:matka/View/Screens/withdraw%20Setup/withdraw_setup.dart';
import 'package:matka/View/Screens/withdrawHistory_screen.dart';
import 'package:matka/View/Screens/withdraw_screen.dart';
import 'package:matka/View/authentication/auth_screen.dart';
import 'package:matka/View/authentication/otp_screen.dart';
import 'package:matka/View/authentication/password_setup.dart';
import 'package:matka/View/authentication/resetp_screen.dart';
import 'package:matka/View/authentication/signin_screen.dart';
import 'package:matka/View/authentication/signup_screen.dart';

class MaterialRoute {
  static Map<String, WidgetBuilder> routes() {
    return {
      "auth_splash_screen": (context) => const AuthScreen(),
      "signUp_screen": (context) => const SignUpSecreen(),
      "signIn_screen": (context) => const SignInScreen(),
      "resetpassword_screen": (context) => const ResetPassword(),
      "otp_screen": (context) => const OtpScreen(),
      "navbar_screen": (context) => BottomNav(),
      "add_balance_screen": (context) => const AddBalanceScreen(),
      "account_update_screen": (context) => const AccountUpdateScreen(),
      "withdraw_screen": (context) => const WithdrawScreen(),
      "games_rules_screen": (context) => const GamesRulesScreen(),
      "games_timing_screen": (context) => const GamesTimingScreen(),
      "refer_history_screen": (context) => const ReferHistoryScreen(),
      "refer_earn_screen": (context) => const ReferEarnScreen(),
      "update_resetpassword_screen": (context) => const PasswordSetup(),
      "withdraw-history-screen": (context) => WithdawHistroyScreen(),
      "deposit-history-screen": (context) => DepositHistroyScreen(),
      "withdraw-setup-screen": (context) => WithdrawSetupScreen(),
      "deposit-select-screen": (context) => DepositMethodSelect(),
      "deposit-upi-screen": (context) => UpiRechargeScreen(),
      "googlepay-Setup-screen": (context) => GooglepeySetup(),
      "phonepay-Setup-screen": (context) => PhonepaySetup(),
      "bank-Setup-screen": (context) => BankSetup(),
      "paytm-Setup-screen": (context) => PaytmSetup(),
    };
  }
}

class Routes {
  Routes._();
  static const String authScreen = "auth_splash_screen";
  static const String signupScreen = "signUp_screen";
  static const String signinScreen = "signIn_screen";
  static const String resetpScreen = "resetpassword_screen";
  static const String otpScreen = "otp_screen";
  static const String navScreen = "navbar_screen";
  static const String addbalanceScreen = "add_balance_screen";
  static const String accountUpdateScreen = "account_update_screen";
  static const String withdrawScreen = "withdraw_screen";
  static const String gamesruleScreen = "games_rules_screen";
  static const String gamestimingScreen = "games_timing_screen";
  static const String referhistoryScreen = "refer_history_screen";
  static const String referearnScreen = "refer_earn_screen";
  static const String passwordSetup = "update_resetpassword_screen";
  static const String withdrawhistoryScreen = "withdraw-history-screen";
  static const String deposithistoryScreen = "deposit-history-screen";
  static const String withdrawSetupScreen = "withdraw-setup-screen";
  static const String depositSelectionScreen = "deposit-select-screen";
  static const String depositUpiScreen = "deposit-upi-screen";
  static const String googlePaysetupScreen = "googlepay-Setup-screen";
  static const String phonePaysetupScreen = "phonepay-Setup-screen";
  static const String bankSetupScreen = "bank-Setup-screen";
  static const String paytmSetupScreen = "paytm-Setup-screen";
}
