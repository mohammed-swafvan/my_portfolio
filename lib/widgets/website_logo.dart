import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class WebsiteLogo extends StatelessWidget {
  const WebsiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Text(
        "Portfolio",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: CustomColors.yellowSecondary,
        ),
      ),
    );
  }
}
