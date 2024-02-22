import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/header_items.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavitemTap});

  final Function(int) onNavitemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.scaffoldBg,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                ),
              ),
            ),
          ),
          for (int i = 0; i < HeaderItems.headerIconList.length; i++)
            ListTile(
              onTap: () {
                onNavitemTap(i);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              leading: Icon(HeaderItems.headerIconList[i]),
              title: Text(HeaderItems.headerTitleList[i]),
              titleTextStyle: const TextStyle(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }
}
