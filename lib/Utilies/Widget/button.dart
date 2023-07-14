import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/generated/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.ontap,
    this.title = "Tap",
    this.color,
    this.height,
    this.fontsize,
    this.radius,
    this.elevation,
  });

  final Function()? ontap;
  final String title;
  final Color? color;
  final double? height;
  final double? fontsize;
  final double? radius;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * 0.068,
      width: size.width,
      child: ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 2,
          side: const BorderSide(color: Colors.white, width: 0.6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10)),
          backgroundColor: color ?? Colors.white,
        ),
        child: FittedBox(
          child: Text(
            title,
            style: GoogleFonts.cairo(
              textStyle: TextStyle(
                fontSize: fontsize ?? 20,
                fontWeight: FontWeight.bold,
                color: color == null ? Materialcolor.buttonColor : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
