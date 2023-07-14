import 'package:flutter/material.dart';
import 'package:matka/Utilies/Widget/snackbar.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  Future<void> launchPhoneDialer(BuildContext context) async {
    final Uri phoneUri = Uri(scheme: "tel", path: "03023147342");
    try {
      await launchUrl(phoneUri);
    } catch (error) {
      showSnackBar(context: context, message: "Something went wrong");
    }
  }

  void _launchWhatsAppDialer(BuildContext context) async {
    const phoneNumber =
        '+923023147342'; // Replace with the desired phone number

    var url = "whatsapp://send?phone=$phoneNumber" +
        "&text=${Uri.encodeComponent("hello")}";

    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      print(e);
      showSnackBar(context: context, message: e.toString(), error: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: Materialcolor.appbarColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: size.height * 0.5,
              width: size.width,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesCallCenter),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () => _launchWhatsAppDialer(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Materialcolor.appbarColor,
                        elevation: 0),
                    child: Image.asset(Assets.imagesWhatsAppCall),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Materialcolor.appbarColor,
                        elevation: 0),
                    onPressed: () => launchPhoneDialer(context),
                    child: Image.asset(Assets.imagesCall),
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
