import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/auth.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';

class SignUpSecreen extends StatefulWidget {
  const SignUpSecreen({super.key});

  @override
  State<SignUpSecreen> createState() => _SignUpSecreenState();
}

class _SignUpSecreenState extends State<SignUpSecreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late TextEditingController _cpasswordController;
  late TextEditingController _refernceidController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _cpasswordController = TextEditingController();
    _refernceidController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _cpasswordController.dispose();
    _refernceidController.dispose();
    super.dispose();
  }

  bool hideText1 = false;
  bool hideText2 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      // resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Create Account",
          trailing: [
            SizedBox(),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                logotitle,
                SlideInUp(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Name",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      CustomTextField(
                        controller: _nameController,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "Name must not be empty";
                          }
                          return null;
                        },
                        hintText: "Enter your name",
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Phone Number",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      CustomTextField(
                        controller: _phoneController,
                        keyboadType: TextInputType.number,
                        hintText: "Enter your phone number",
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "Phone number must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Refernce id",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      CustomTextField(
                        controller: _refernceidController,
                        keyboadType: TextInputType.number,
                        hintText: "Enter reference id(Optional)",
                        valid: (value) {
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Password",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Your password",
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              hideText1 = !hideText1;
                            });
                          },
                          icon: Icon(
                            hideText1
                                ? Icons.visibility_off_rounded
                                : Icons.visibility,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "password must not be empty";
                          }
                          return null;
                        },
                        hideText: hideText1,
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      CustomTextField(
                        controller: _cpasswordController,
                        hintText: "Type confirm password again",
                        hideText: hideText2,
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              hideText2 = !hideText2;
                            });
                          },
                          icon: Icon(
                            hideText2
                                ? Icons.visibility_off_rounded
                                : Icons.visibility,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "Password must not be empty";
                          } else if (value.trim() != _passwordController.text) {
                            return "Password should be matched";
                          } else if (value.length < 8) {
                            return "Password should be at least 8 character";
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Password must not be less than 8 characters",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                SlideInUp(
                  delay: const Duration(milliseconds: 200),
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
                        bool successfully = await Auth.signUp(
                          name: _nameController.text,
                          phone: _phoneController.text,
                          password: _passwordController.text,
                          Cpassword: _cpasswordController.text,
                          context: context,
                        );
                        if (successfully) {
                          Navigator.of(context).pop();
                          showSnackBar(
                              context: context,
                              message: "Otp send successfully");
                          Navigator.pushNamed(context, Routes.otpScreen);
                        } else {
                          Navigator.of(context).pop();
                          FocusScope.of(context).unfocus();
                        }
                      }
                    },
                    title: "Sign Up",
                    color: Materialcolor.buttonColor,
                  ),
                ),
                SlideInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(Routes.signinScreen);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
