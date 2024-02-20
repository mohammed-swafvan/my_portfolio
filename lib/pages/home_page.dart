import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/custom_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.scaffoldBg,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          /// Main Section
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.maxFinite,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    CustomColors.bgLight1,
                  ],
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Text("Portfolio"),
                const Spacer(),
                for (var i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Button"),
                    ),
                  ),
              ],
            ),
          ),

          /// Skills Section
          Container(
            height: 500,
            width: double.maxFinite,
          ),

          /// Projects Section
          Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),

          /// Contact Section
          Container(
            height: 500,
            width: double.maxFinite,
          ),

          /// Footer Section
          Container(
            height: 500,
            width: double.maxFinite,
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
