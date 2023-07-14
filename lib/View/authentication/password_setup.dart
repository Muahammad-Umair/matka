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

class PasswordSetup extends StatefulWidget {
  const PasswordSetup({super.key});

  @override
  State<PasswordSetup> createState() => _PasswordSetupState();
}

class _PasswordSetupState extends State<PasswordSetup> {
  late TextEditingController otpController;
  late TextEditingController passwordController;
  late TextEditingController confirmpasswordController;

  @override
  void initState() {
    otpController = TextEditingController();
    passwordController = TextEditingController();
    confirmpasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Password Setup",
          trailing: [
            SizedBox(),
          ],
          centerTitle: true,
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
                          "Otp Number",
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
                          controller: otpController,
                          hintText: "Enter your otp number",
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "Otp number must not be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SlideInLeft(
                        child: Text(
                          "Password",
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
                          controller: passwordController,
                          hintText: "Enter your password",
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "password must not be empty";
                            } else if (value.length < 8) {
                              return "password must not be less than 8";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SlideInLeft(
                        child: Text(
                          "Confirm Password",
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
                          controller: confirmpasswordController,
                          hintText: "Enter your confirm password",
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "confirm password must not be empty";
                            } else if (value != passwordController.text) {
                              return "Password should be matched";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
              ),
              SlideInUp(
                child: CustomButton(
                  ontap: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Materialcolor.buttonColor,
                          ),
                        ),
                      );

                      bool status = await Auth.resetupdatePassword(
                          otp: otpController.text,
                          password: passwordController.text,
                          context: context);
                      if (status) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.signinScreen, (route) => false);
                      } else {
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      }
                    }
                  },
                  color: Materialcolor.buttonColor,
                  title: "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
