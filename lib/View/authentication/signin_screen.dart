import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/auth.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool hideText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(toolBarHeight),
          child: CustomAppBar(
            title: "Sign In",
            trailing: [
              SizedBox(),
            ],
          )),
      body: Center(
        child: Form(
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
                            keyboadType: TextInputType.number,
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Phone number must not be empty";
                              }
                              return null;
                            },
                            hintText: "Enter your phone number",
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.015,
                        ),
                        SlideInRight(
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
                          height: size.height * 0.002,
                        ),
                        SlideInRight(
                          child: CustomTextField(
                            controller: _passwordController,
                            hideText: hideText,
                            trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  hideText = !hideText;
                                });
                              },
                              icon: Icon(
                                hideText
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            valid: (value) {
                              if (value!.isEmpty) {
                                return "Password must not be empty";
                              }

                              return null;
                            },
                            hintText: "Enter your password",
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SlideInRight(
                              child: TextButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, Routes.resetpScreen);
                            },
                            child: const Text(
                              "Forget your password",
                            ),
                          )),
                        )
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
                          barrierDismissible: false,
                          builder: (context) => Center(
                            child: CircularProgressIndicator(
                              color: Materialcolor.buttonColor,
                            ),
                          ),
                        );
                        String result = await Auth.signIn(
                          number: _phoneController.text,
                          password: _passwordController.text,
                          context: context,
                        );

                        if (result == "true") {
                          await ApiService.checkbalance(context);
                          Navigator.of(context).pop();

                          await showSnackBar(
                              context: context,
                              message: "Sign in successfully");

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.navScreen, (route) => false);
                        } else if (result ==
                            "Please verify your phone number") {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => Customdialog1(),
                          );
                        } else {
                          Navigator.of(context).pop();
                          FocusScope.of(context).unfocus();
                          return;
                        }
                      }
                    },
                    title: "Sign In",
                    color: Materialcolor.buttonColor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.065,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signupScreen);
              },
              child: const Text(
                "Create account",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Customdialog1 extends StatefulWidget {
  Customdialog1({
    super.key,
  });

  @override
  State<Customdialog1> createState() => _Customdialog1State();
}

class _Customdialog1State extends State<Customdialog1> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: size.height * 0.2,
        width: size.width,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verification",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              "Please verify your phone number to go forward",
              style: GoogleFonts.notoSans(
                fontSize: 13,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            SizedBox(
              width: size.width * 0.6,
              height: size.height * 0.06,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });

                  bool result = await Auth.resendOtp(context: context);

                  if (result) {
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pop();
                    Navigator.pushNamed(
                      context,
                      Routes.otpScreen,
                    );
                  } else {
                    setState(() {
                      loading = false;
                    });
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loading
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10)
                                .copyWith(left: 0, right: 10),
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    Text(
                      "Send code",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Color(0xFFC62828),
                  backgroundColor: Materialcolor.buttonColor,
                  // padding: EdgeInsets.symmetric(horizontal: 32.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
