import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/custom_colors.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColors.scaffoldBg,
          endDrawer: constraints.maxWidth < 600 ? const DrawerMobile() : null,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              /// Main Section
              if(constraints.maxWidth >= 600)
              const HeaderDesktop()
              else HeaderMobile(
                onlogoTap: () {},
                onMenutap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                },
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
    );
  }
}
