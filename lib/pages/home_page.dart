import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/constants/custom_size.dart';
import 'package:my_portfolio/constants/height_width.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
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

            Heightwidth.hight20,

            /// Projects Section
            const ProjectSection(),

            Heightwidth.hight20,

            /// Contact Section
            const ContactSection(),

            /// Footer Section
            const Footer(),
          ],
        ),
      );
    });
  }
}
