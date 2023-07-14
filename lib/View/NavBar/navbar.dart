import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/navcontroller.dart';
import 'package:matka/Model/service.dart';
import 'package:matka/Utilies/Widget/appbar.dart';
import 'package:matka/Utilies/Widget/custom_drawer.dart';
import 'package:matka/View/Bid%20Screen/mybid.dart';
import 'package:matka/View/Call%20Screen/call_screen.dart';
import 'package:matka/View/GameR%20Screen/game_result.dart';
import 'package:matka/View/Setting%20Screen/setting.dart';
import 'package:matka/generated/color.dart';
import 'package:provider/provider.dart';

import '../Home Screen/home_screen.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  final List<Widget> _pages = [
    HomeScreen(),
    BidHistoryresultScreen(),
    CustomCatagoryResult(),
    const CallScreen(),
    const SettingScreen(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController =
        context.watch<BottomNavController>();
    ApiService.checkbalance(context);

    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Materialcolor.greyColor,
      backgroundColor: Materialcolor.backgroundColor,
      bottomNavigationBar: SlideInUp(
        child: BottomNavigationBar(
          currentIndex: bottomNavController.index,
          type: BottomNavigationBarType.fixed,
          // iconSize: 30,
          backgroundColor: Materialcolor.appbarColor,
          unselectedItemColor: Materialcolor.greyColor,

          showUnselectedLabels: true,
          onTap: (value) {
            bottomNavController.changeIndex(value);
          },
          selectedItemColor: Materialcolor.buttonColor,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events_outlined), label: "My Bid"),
            BottomNavigationBarItem(
                icon: Icon(Icons.domain_outlined), label: "Game Result"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Contact"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      drawerEnableOpenDragGesture: true,
      appBar: bottomNavController.index == 4
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppBar(
                title: "Tiger Casino",
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Materialcolor.buttonColor,
                  ),
                ),
              ),
            ),
      body: _pages[bottomNavController.index],
    );
  }
}

// this is custom listtile for for the drawer items
class Customlisttile2 extends StatelessWidget {
  const Customlisttile2(
      {super.key, required this.icon, required this.tap, required this.title});
  final IconData icon;
  final Function()? tap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 10, bottom: 1),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              icon,
              size: 24,
            ),
          ),
          onTap: tap,
          title: Text(
            title,
            style: GoogleFonts.robotoSlab(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Materialcolor.appbarTitleColor,
            ),
          ),
        ),
        const Divider(
          color: Materialcolor.greyColor,
        )
      ],
    );
  }
}
