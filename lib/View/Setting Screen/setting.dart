import 'package:flutter/material.dart';
import 'package:matka/Utilies/constant.dart';
import 'package:matka/View/NavBar/navbar.dart';
import 'package:matka/generated/assets.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';
import 'package:share_plus/share_plus.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String image = sharedPreferences.getString('image') ?? '';
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.4,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Materialcolor.thirdColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.1,
                child: Center(
                  child: Container(
                    height: size.height / 3.8,
                    width: size.width - 80,
                    margin: EdgeInsets.symmetric(horizontal: size.width / 9),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height / 80),
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: image.isNotEmpty
                              ? NetworkImage(image) as ImageProvider
                              : AssetImage(Assets.imagesProfileImage),
                        ),
                        SizedBox(height: size.height / 200),
                        Text(
                          sharedPreferences.getString('name') ?? '',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: size.height / 150),
                        Text(
                          sharedPreferences.getString('phone') ?? '',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: size.height / 60),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height - size.height * 0.48,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Customlisttile2(
                    icon: Icons.wallet_outlined,
                    tap: () {
                      Navigator.of(context).pushNamed(Routes.addbalanceScreen);
                    },
                    title: "ADD MONEY"),
                Customlisttile2(
                  icon: Icons.edit,
                  tap: () {
                    Navigator.of(context).pushNamed(Routes.accountUpdateScreen);
                  },
                  title: "UPDATE ACCCOUNT",
                ),
                Customlisttile2(
                  icon: Icons.arrow_upward,
                  title: "WITHDRAW",
                  tap: () {
                    Navigator.of(context).pushNamed(Routes.withdrawScreen);
                  },
                ),
                Customlisttile2(
                  icon: Icons.note,
                  title: "GAME RULES & REGULATIONS",
                  tap: () {
                    Navigator.of(context).pushNamed(Routes.gamesruleScreen);
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
                  icon: Icons.history_outlined,
                  title: "WITHDRAW HISTORY",
                  tap: () {
                    Navigator.pushNamed(context, Routes.withdrawhistoryScreen);
                  },
                ),
                Customlisttile2(
                  icon: Icons.share_rounded,
                  title: "SHARE APP",
                  tap: () {
                    final RenderBox box =
                        context.findRenderObject() as RenderBox;
                    final String text = 'Check out this amazing app!';
                    final String appLink =
                        'https://something.com'; // Replace with your app's store link
                    final String shareText = '$text\n$appLink';
                    Share.share(shareText,
                        sharePositionOrigin:
                            box.localToGlobal(Offset.zero) & box.size);
                  },
                ),
                Customlisttile2(
                    icon: Icons.logout,
                    tap: () async {
                      await sharedPreferences.clear();
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.authScreen, (route) => false);
                    },
                    title: "LOGOUT")
              ],
            ),
          ),
        )
      ],
    );
  }
}
