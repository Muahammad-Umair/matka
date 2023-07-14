import 'package:flutter/material.dart';
import 'package:matka/Controller/navcontroller.dart';
import 'package:matka/Utilies/Widget/button.dart';
import 'package:matka/generated/color.dart';
import 'package:matka/generated/routes.dart';
import 'package:provider/provider.dart';

class CustomButtonContainer extends StatelessWidget {
  const CustomButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BottomNavController navController = context.read<BottomNavController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  ontap: () {
                    Navigator.pushNamed(context, Routes.depositSelectionScreen);
                  },
                  color: Materialcolor.buttonColor,
                  title: 'ADD BALANCE',
                  fontsize: 10,
                  height: size.height * 0.05,
                  radius: 10,
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                child: CustomButton(
                  ontap: () {
                    // Got to account update screen
                    Navigator.of(context).pushNamed(Routes.accountUpdateScreen);
                  },
                  fontsize: 10,
                  height: size.height * 0.05,
                  color: Materialcolor.cardColor,
                  title: 'ACCOUNT UPDATE',
                  radius: 10,
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                child: CustomButton(
                  radius: 12,
                  ontap: () {
                    Navigator.pushNamed(context, Routes.withdrawScreen);
                  },
                  fontsize: 10,
                  height: size.height * 0.05,
                  color: Materialcolor.buttonColor,
                  title: 'WITHDRAW BALANCE',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  ontap: () {
                    navController.changeIndex(1);
                  },
                  color: Materialcolor.cardColor,
                  title: 'MY BIDS',
                  fontsize: 10,
                  height: size.height * 0.05,
                  radius: 10,
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                child: CustomButton(
                  ontap: () {
                    navController.changeIndex(2);
                  },
                  fontsize: 10,
                  color: Materialcolor.buttonColor,
                  title: 'RESULT',
                  height: size.height * 0.05,
                  radius: 10,
                ),
              ),
              SizedBox(
                width: size.width * 0.06,
              ),
              Expanded(
                child: CustomButton(
                  ontap: () {
                    navController.changeIndex(4);
                  },
                  fontsize: 10,
                  radius: 10,
                  color: Materialcolor.cardColor,
                  title: 'SETTING',
                  height: size.height * 0.05,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
