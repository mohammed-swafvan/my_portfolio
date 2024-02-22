import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/header_items.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/website_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavitemTap});

  final Function(int) onNavitemTap;

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      duration: const Duration(milliseconds: 1500),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 12).copyWith(left: 24),
        width: double.maxFinite,
        decoration: Style.navBarDecoration,
        child: Row(
          children: [
            WebsiteLogo(onTap: () {}),
            const Spacer(),
            for (var i = 0; i < HeaderItems.headerTitleList.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: TextButton(
                  onPressed: () {
                    onNavitemTap(i);
                  },
                  child: Text(
                    HeaderItems.headerTitleList[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.whitePrimary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
