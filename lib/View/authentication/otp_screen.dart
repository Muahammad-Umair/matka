import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/auth.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _otpController;
  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Opt Screen",
          centerTitle: false,
          trailing: [
            SizedBox(),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              logotitle,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      SlideInLeft(
                        child: Text(
                          "Otp",
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textfieldlabelColor,
                              fontSize: labelfontSize,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.003,
                      ),
                      SlideInLeft(
                        child: CustomTextField(
                          controller: _otpController,
                          hintText: "Enter your otp",
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "Otp must not be empty";
                            } else if (value.length < 4) {
                              return "Otp must have 4 character";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            load
                                ? SizedBox(
                                    height: 22,
                                    width: 22,
                                    child: CircularProgressIndicator(
                                      color: Materialcolor.buttonColor,
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                                onPressed: () async {
                                  setState(() {
                                    load = true;
                                  });
                                  bool status =
                                      await Auth.resendOtp(context: context);

                                  setState(() {
                                    load = false;
                                  });
                                },
                                child: Text('Resend otp'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SlideInUp(
                child: CustomButton(
                  title: "Submit",
                  color: Materialcolor.buttonColor,
                  ontap: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );

                      bool status = await Auth.verifyOtp(
                          otp: _otpController.text, context: context);

                      if (status) {
                        Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.navScreen, (route) => false);
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
