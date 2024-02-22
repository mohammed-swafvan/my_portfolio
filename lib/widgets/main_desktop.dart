import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/height_width.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key, required this.onGetInTouch});
  final Function() onGetInTouch;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeInLeft(
            duration: const Duration(seconds: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hi,",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whitePrimary,
                  ),
                ),
                const Text(
                  "Mohammed Swafvan",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.whitePrimary,
                  ),
                ),
                const Text(
                  "Flutter Developer",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whitePrimary,
                  ),
                ),
                Heightwidth.hight5,
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Image.asset("assets/images/location_icon.png", width: 16),
                    const Text(
                      "Malappuram, Kerala, India",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.whitePrimary,
                      ),
                    ),
                  ],
                ),
                Heightwidth.hight15,
                SizedBox(
                  width: 180,
                  child: ElevatedButton(
                    onPressed: onGetInTouch,
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
          ),
          FadeInRight(
            duration: const Duration(seconds: 2),
            child: Container(
              height: screenWidth / 4,
              width: screenWidth / 4,
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
          ),
        ],
      ),
    );
  }
}
