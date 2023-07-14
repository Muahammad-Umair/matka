import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';

class PaytmSetup extends StatefulWidget {
  const PaytmSetup({super.key});

  @override
  State<PaytmSetup> createState() => _PaytmSetupState();
}

class _PaytmSetupState extends State<PaytmSetup> {
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Paytm",
          centerTitle: true,
        ),
      ),
      resizeToAvoidBottomInset: false,
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
                  "Account Number",
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
                  hintText: "Enter your account number",
                  valid: (value) {
                    if (value.toString().isEmpty) {
                      return "Account number should not be empty";
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
          title: "Submit",
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
              bool result = await ApiService.updateWithdraw(
                context: context,
                paytmAddress: controller.text,
              );

              if (result) {
                controller.clear();

                Navigator.of(context).pop();
                FocusScope.of(context).unfocus();
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
