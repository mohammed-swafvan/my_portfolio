import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/utils/project_utils.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 270,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: CustomColors.bgLight2,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Image.asset(
            project.image,
            height: 160,
            width: 270,
            fit: BoxFit.cover,
          ),
          //Title
          Padding(
            padding: const EdgeInsets.all(12).copyWith(bottom: 6),
            child: Text(
              project.title,
              style: const TextStyle(
                color: CustomColors.whitePrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          //Subtitle
          Padding(
            padding: const EdgeInsets.all(12).copyWith(top: 0),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                color: CustomColors.whiteSecondary,
                fontSize: 11,
                height: 1.3,
              ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            color: CustomColors.bgLight1,
            child: Row(
              children: [
                const Text(
                  "Availabe on:",
                  style: TextStyle(
                    color: CustomColors.yellowSecondary,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    js.context.callMethod("open", [project.amazonLink]);
                  },
                  child: Image.asset(
                    "assets/images/amazon_appstore_icon.png",
                    width: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: InkWell(
                    onTap: () {
                      js.context.callMethod("open", [project.githubLink]);
                    },
                    child: Image.asset(
                      "assets/images/github_icon.png",
                      width: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
