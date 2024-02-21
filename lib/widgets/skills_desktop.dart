import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/height_width.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(32).copyWith(bottom: 80),
      width: screenWidth,
      color: CustomColors.bgLight1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          const Text(
            "What I can do ?",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          Heightwidth.hight40,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Platforms
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 450,
                ),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (int i = 0; i < SkillItems.platFormItems.length; i++)
                      Container(
                        width: 180,
                        decoration: BoxDecoration(
                          color: CustomColors.bgLight2,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: Image.asset(
                            SkillItems.platFormItems[i]["img"],
                            width: 26,
                            height: 26,
                          ),
                          title: Text(SkillItems.platFormItems[i]["title"]),
                        ),
                      ),
                  ],
                ),
              ),
              Heightwidth.width50,
              // Skills
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 500,
                  ),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for(int i = 0; i < SkillItems.skillItems.length; i++)
                      Chip(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        avatar: Image.asset(SkillItems.skillItems[i]["img"]),
                        label: Text(SkillItems.skillItems[i]["title"]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
