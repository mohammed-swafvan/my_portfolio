import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 26),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: const Text(
        "Made by Mohammed Swafvan with Flutter 3.16",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: CustomColors.whiteSecondary,
          fontSize: 10,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
