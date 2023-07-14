import 'dart:core';

class Api {
  static const String baseApi =
      "https://matka.indiaonlinesolution.com/public/api/v1";
  static const String register = "$baseApi/register";
  static const String signIn = "$baseApi/login";
  static const String resendotpApi = "$baseApi/resend-otp";
  static const String verifyotpApi = "$baseApi/verify-otp";
  static const String catergories = "$baseApi/categories";
  static const String gamesCategories = "$baseApi/category_games";
  static const String deposit = "$baseApi/deposit_request";
  static const String submitBid = "$baseApi/bid_on_game";
  static const String checkBalance = "$baseApi/user_balance";
  static const String addBalance = "$baseApi/deposit_request";
  static const String withdrawBalance = "$baseApi/withdraw_request";
  static const String sliderImageTextApi = "$baseApi/slider_text_image";
  static const String gameResult = "$baseApi/game_win_number_list";
  static const String bidsGameHistory = "$baseApi/user_bids_games";
  static const String bidHistory = "$baseApi/user_bids_history";
  static const String updateNameImage = '$baseApi/update-profile';
  static const String resetPassword = '$baseApi/reset-password';
  static const String updatePassword = '$baseApi/update/password';
  static const String resetupdatePassword = '$baseApi/forgot/update-password';
  static const String withdrawhistory = '$baseApi/user_withdraw_history';
  static const String deposithistory = '$baseApi/user_deposit_history';
  static const String gameRules = '$baseApi/rules';
  static const String referalHistory = '$baseApi/referral_users';
  static const String addupibalance = '$baseApi/upi-create_order';
  static const String updatePaymentMethod = '$baseApi/add_payment_methods';
}
