import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/balance_controller.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class UpiRechargeScreen extends StatefulWidget {
  const UpiRechargeScreen({super.key});

  @override
  State<UpiRechargeScreen> createState() => _UpiRechargeScreenState();
}

class _UpiRechargeScreenState extends State<UpiRechargeScreen> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  //this is loading for the add balance button
  bool loading = false;

  // this is for the loading of view button
  bool loading2 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final balanceContoller = context.read<BalanceController>();
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Account Recharge",
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                logotitle,
                SizedBox(
                  height: size.height * 0.06,
                ),
                Text(
                  "Amount",
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textfieldlabelColor,
                      fontSize: labelfontSize,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.004,
                ),
                CustomTextField(
                  controller: controller,
                  hintText: "Enter your amount",
                  valid: (value) {
                    if (value.toString().isEmpty) {
                      return "Amount should not be empty";
                    } else if (int.parse(value.toString()) < 10) {
                      return "Amount should not less than 10";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: CustomButton(
          title: "Add Balance",
          color: Materialcolor.buttonColor,
          ontap: () async {
            if (_formKey.currentState!.validate()) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
              bool result = await ApiService.addUpiAmount(
                  amount: controller.text, context: context);

              if (result) {
                Navigator.of(context).pop();
                String url =
                    await sharedPreferences.getString('paymentUrl').toString();
                await ApiService.termlunch(context, url);
                await ApiService.checkbalance(context);
              } else {
                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
              }
            }
          },
        ),
      ),
    );
  }
}
