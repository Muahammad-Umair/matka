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

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Password Reset",
          trailing: [
            SizedBox(),
          ],
        ),
      ),
      body: Form(
        key: _formkey,
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
                          "Phone Number",
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
                          controller: _phoneController,
                          hintText: "Enter your phone number",
                          valid: (value) {
                            if (value!.isEmpty) {
                              return "Phone number must not be empty";
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
                    if (_formkey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => Center(
                            child: CircularProgressIndicator(
                          color: Materialcolor.buttonColor,
                        )),
                      );

                      bool status = await Auth.resetPassword(
                          phoneNumber: _phoneController.text, context: context);

                      if (status) {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, Routes.passwordSetup);
                      } else {
                        Navigator.pop(context);
                        FocusScope.of(context).unfocus();
                      }
                    }
                  },
                  color: Materialcolor.buttonColor,
                  title: "Get otp",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
