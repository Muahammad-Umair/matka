import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  late final TextEditingController numberController;
  late final TextEditingController amountController;
  late final TextEditingController accountController;

  // here is list of transaction method we are used
  final List<String> transactionMethod = const [
    "Bank Transfer",
    "GPay",
    "PhonePe",
    "Paytm",
    "UPI",
  ];
  // selected payment method
  String selected = "Bank Transfer";

  // agree to the terms and conditions
  bool agree = false;

  @override
  void initState() {
    numberController = TextEditingController();
    amountController = TextEditingController();
    accountController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    numberController.dispose();
    amountController.dispose();
    accountController.dispose();
    super.dispose();
  }

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Materialcolor.backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          title: "Withdraw Balance",
          centerTitle: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            logotitle,
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
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
                        height: size.height * 0.003,
                      ),
                      CustomTextField(
                        controller: accountController,
                        hintText: 'Enter your name',
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "account number  must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Online Number",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.003,
                      ),
                      CustomTextField(
                        controller: numberController,
                        hintText: 'Enter your online number',
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "phone number must not be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.02,
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
                        height: size.height * 0.003,
                      ),
                      CustomTextField(
                        controller: amountController,
                        hintText: 'Enter your amount',
                        valid: (value) {
                          if (value!.isEmpty) {
                            return "amount must not be empty";
                          } else if (int.parse(value) < 20) {
                            return "Amount should not less than 20";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Text(
                        "Transaction with",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Column(
                        children: transactionMethod
                            .map((transaction) => RadioListTile(
                                  value: transaction,
                                  activeColor: Materialcolor.buttonColor,
                                  title: Text(transaction),
                                  groupValue: selected,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 0),
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      selected = value.toString();
                                    });
                                  },
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            padding: const EdgeInsets.all(30),
                            height: size.height * 0.5,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Text(
                              "WIthdrawe will withdraw daily form 10 pm to 9 p.m other payment will done in next bussiness day",
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: textfieldlabelColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ));
                },
                child: Text(
                  "Terms & conditions",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            CustomButton(
              ontap: () async {
                if (_formkey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) => Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                  bool status = await ApiService.withdrawAmount(
                    accountNumber: accountController.text,
                    amount: amountController.text,
                    mode: selected,
                    number: numberController.text,
                    context: context,
                  );

                  if (status) {
                    await ApiService.checkbalance(context);
                    accountController.clear();
                    amountController.clear();
                    numberController.clear();

                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  } else {
                    Navigator.of(context).pop();
                    FocusScope.of(context).unfocus();
                  }
                  ;
                }
              },
              title: 'WITHDRAW',
              color: Materialcolor.buttonColor,
            )
          ],
        ),
      ),
    );
  }
}
