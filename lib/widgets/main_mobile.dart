import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/height_width.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: screenHeight / 1.6,
      constraints: const BoxConstraints(minHeight: 460),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenWidth / 2.5,
            width: screenWidth / 2.5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset(
                "assets/images/my_profile.JPG",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Heightwidth.hight20,
          const Text(
            "Hi,",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: CustomColors.whitePrimary,
            ),
          ),
          const Text(
            "Mohammed Swafvan",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          const Text(
            "Flutter Developer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CustomColors.whitePrimary,
            ),
          ),
          Heightwidth.hight10,
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.yellowPrimay,
              ),
              child: const Text(
                "Get in touch",
                style: TextStyle(
                  color: CustomColors.whitePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
