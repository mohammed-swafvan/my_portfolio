import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/height_width.dart';
import 'package:my_portfolio/utils/project_utils.dart';
import 'package:my_portfolio/widgets/project_card_widget.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(32).copyWith(bottom: 80),
      child: Column(
        children: [
          //Title
          const Text(
            "Main Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColors.whitePrimary,
            ),
          ),
          Heightwidth.hight40,
          //Project Cards
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Wrap(
              spacing: 28,
              runSpacing: 28,
              children: [
                for (int i = 0; i < mainProjectsList.length; i++)
                  ProjectCardWidget(
                    project: mainProjectsList[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
