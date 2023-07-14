import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matka/Controller/navcontroller.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/View/NavBar/navbar.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navController =
        context.read<BottomNavController>();
    Size size = MediaQuery.of(context).size;
    String image = sharedPreferences.getString('image') ?? '';
    return SafeArea(
      child: Drawer(
        backgroundColor: Materialcolor.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                decoration:
                    const BoxDecoration(color: Materialcolor.thirdColor),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: image.isNotEmpty
                          ? NetworkImage(image) as ImageProvider
                          : AssetImage(
                              Assets.imagesProfileImage,
                            ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sharedPreferences.getString('name') ?? '',
                          style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Materialcolor.appbarTitleColor),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            sharedPreferences.getString("phone") ?? '',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Materialcolor.appbarTitleColor
                                    .withOpacity(0.4)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Customlisttile2(
                    icon: Icons.home_outlined,
                    title: "HOME",
                    tap: () {
                      navController.changeIndex(0);
                      Navigator.pop(context);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.wallet_outlined,
                    title: "ADD MONEY",
                    tap: () {
                      Navigator.of(context)
                          .pushNamed(Routes.depositSelectionScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.arrow_upward,
                    title: "WITHDRAW MONEY",
                    tap: () {
                      Navigator.of(context).pushNamed(Routes.withdrawScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.sync_alt,
                    title: "DEPOSIT HISTORY",
                    tap: () {
                      Navigator.pushNamed(context, Routes.deposithistoryScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.sync_alt,
                    title: "WITHDRAW HISTORY",
                    tap: () {
                      Navigator.pushNamed(
                          context, Routes.withdrawhistoryScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.payments_outlined,
                    title: "WITHDRAW SETUP",
                    tap: () {
                      Navigator.pushNamed(context, Routes.withdrawSetupScreen);
                    },
                  ),

                  Customlisttile2(
                    icon: Icons.note,
                    title: "GAME RULES",
                    tap: () {
                      Navigator.of(context).pushNamed(Routes.gamesruleScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.history,
                    title: "REFER & EARN",
                    tap: () {
                      Navigator.of(context).pushNamed(Routes.referearnScreen);
                    },
                  ),
                  Customlisttile2(
                    icon: Icons.history_outlined,
                    title: "REFER HISTORY",
                    tap: () {
                      Navigator.of(context)
                          .pushNamed(Routes.referhistoryScreen);
                    },
                  ),
                  // Customlisttile2(
                  //   icon: Icons.share_rounded,
                  //   title: "SHARE",
                  //   tap: () {
                  //     final RenderBox box =
                  //         context.findRenderObject() as RenderBox;
                  //     final String text = 'Check out this amazing app!';
                  //     final String appLink =
                  //         'https://yourappstorelink.com'; // Replace with your app's store link
                  //     final String shareText = '$text\n$appLink';
                  //     Share.share(shareText,
                  //         sharePositionOrigin:
                  //             box.localToGlobal(Offset.zero) & box.size);
                  //   },
                  // ),
                  Customlisttile2(
                    icon: Icons.logout,
                    title: "LOGOUT",
                    tap: () async {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.authScreen, (route) => false);
                      await sharedPreferences.clear();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
