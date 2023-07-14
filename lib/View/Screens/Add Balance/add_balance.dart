import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/Utilies/Widget/textfield.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/color.dart';

class AddBalanceScreen extends StatefulWidget {
  const AddBalanceScreen({super.key});

  @override
  State<AddBalanceScreen> createState() => _AddBalanceScreenState();
}

class _AddBalanceScreenState extends State<AddBalanceScreen> {
  late final TextEditingController amountC;
  late final TextEditingController transectionIdC;

  @override
  void initState() {
    amountC = TextEditingController();
    transectionIdC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    amountC.dispose();
    transectionIdC.dispose();
    super.dispose();
  }

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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Materialcolor.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(toolBarHeight),
        child: CustomAppBar(
          centerTitle: false,
          title: "Add Balance",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              logotitle,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        controller: amountC,
                        hintText: "Enter your amount",
                        valid: (value) {
                          if (value.toString().isEmpty) {
                            return "Amount should not empty";
                          } else if (int.parse(value.toString()) < 10) {
                            return "Amount should not be less than 10";
                          } else
                            null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Transaction id",
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
                        controller: transectionIdC,
                        hintText: 'Enter your transaction id',
                        valid: (value) {
                          if (value.toString().isEmpty) {
                            return "Transaction id should not empty";
                          } else
                            null;
                        },
                      ),
                      SizedBox(
                        height: size.height * 0.018,
                      ),
                      Text(
                        "Transaction By",
                        style: GoogleFonts.cairo(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textfieldlabelColor,
                            fontSize: labelfontSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.018,
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
              SlideInUp(
                child: CustomButton(
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

                      bool status = await ApiService.addamount(
                          transactionId: transectionIdC.text,
                          amount: amountC.text,
                          mode: selected,
                          context: context);
                      if (status) {
                        await ApiService.checkbalance(context);
                        amountC.clear();
                        transectionIdC.clear();
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      } else {
                        Navigator.of(context).pop();
                        FocusScope.of(context).unfocus();
                      }
                    }
                  },
                  title: 'SUBMIT',
                  color: Materialcolor.buttonColor,
                  elevation: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
