import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/custom_size.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobile.dart';
import 'package:my_portfolio/widgets/project_section.dart';
import 'package:my_portfolio/widgets/skills_desktop.dart';
import 'package:my_portfolio/widgets/skills_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColors.scaffoldBg,
        endDrawer: constraints.maxWidth < CustomSize.minDesktopWidth ? const DrawerMobile() : null,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            /// Header Section
            if (constraints.maxWidth >= CustomSize.minDesktopWidth)
              const HeaderDesktop()
            else
              HeaderMobile(
                onlogoTap: () {},
                onMenutap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
              ),

            /// Main Section
            if (constraints.maxWidth >= CustomSize.minDesktopWidth) const MainDesktop() else const MainMobile(),

            /// Skills Section
            if (constraints.maxWidth >= CustomSize.minDesktopWidth) const SkillsDesktop() else const SkillsMobile(),

            /// Projects Section
            const ProjectSection(),

            /// Contact Section
            Container(
              color: Colors.amber,
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
    });
  }
}
