import 'package:flutter/material.dart';
import 'package:matka/generated/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.hintText = "Enter something here",
      this.hintTextfontSize,
      this.keyboadType = TextInputType.name,
      this.hideText = false,
      this.trailing,
      this.valid});
  final TextEditingController controller;
  final String hintText;
  final double? hintTextfontSize;
  TextInputType keyboadType;
  Widget? trailing;
  String? Function(String?)? valid;
  bool hideText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: valid,
      keyboardType: keyboadType,
      autofocus: false,
      obscureText: hideText,
      style: TextStyle(
        fontSize: hintTextfontSize ?? 15,
        color: Materialcolor.greyColor.shade600,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: trailing ?? null,
        hintStyle: TextStyle(
          fontSize: hintTextfontSize ?? 15,
          color: Materialcolor.greyColor.shade600,
        ),
        filled: true,
        fillColor: Materialcolor.textFieldColor,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: ThemeData()
                    .inputDecorationTheme
                    .focusedBorder
                    ?.borderSide
                    .color ??
                Materialcolor.primaryColor,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.red.shade300,
            width: 2,
          ),
        ),
      ),
    );
  }
}
