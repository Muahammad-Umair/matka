import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/balance_controller.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    this.title = "Appbar",
    this.leading,
    this.trailing,
    this.showBackbutton = true,
    this.centerTitle = true,
  });
  String title;
  Widget? leading;
  List<Widget>? trailing;
  bool showBackbutton;
  bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      child: AppBar(
        title: Text(
          title,
          style: GoogleFonts.cairo(
              textStyle: const TextStyle(
            color: Materialcolor.appbarTitleColor,
          )),
        ),
        elevation: 2,
        // automaticallyImplyLeading: showBackbutton,
        toolbarHeight: toolBarHeight,

        leading: leading ??
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Materialcolor.appbarTitleColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        centerTitle: centerTitle,
        actions: trailing ??
            [
              Consumer<BalanceController>(builder: (context, controller, __) {
                print(
                    '-=-====================================appbar is build againa again');
                return ElevatedButton.icon(
                    icon: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(Assets.imagesEwallet)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                    ),
                    label: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        controller.balnace,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ));
              }),
            ],

        // [
        //   ElevatedButton.icon(
        //       icon: SizedBox(
        //           height: 30,
        //           width: 30,
        //           child: Image.asset(Assets.imagesEwallet)),
        //       onPressed: () {
        //         Navigator.pushNamed(context, Routes.addbalanceScreen);
        //       },
        //       style: ElevatedButton.styleFrom(
        //         elevation: 0,
        //         backgroundColor: Colors.transparent,
        //         padding: const EdgeInsets.symmetric(horizontal: 20),
        //       ),
        //       label: const Padding(
        //         padding: EdgeInsets.all(2.0),
        //         child: Text(
        //           "0.00",
        //           style: TextStyle(color: Colors.black, fontSize: 18),
        //         ),
        //       )),
        // ],
        backgroundColor: Materialcolor.appbarColor,
      ),
    );
  }
}
