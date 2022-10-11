import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news/provider/control_provider.dart';
import 'package:provider/provider.dart';

class ControlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(builder: (context,provider, child){
      return Scaffold(
        body: provider.currentScreen,
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: LineIcons.newspaper,
                    text: 'BreakingNews',
                    backgroundColor:Colors.pink,
                  ),
                  GButton(
                    icon: Icons.sports,

                  ),
                  GButton(
                    icon: LineIcons.search,
                    text: 'Search',
                  ),

                ],
                selectedIndex: provider.currentIndex,
                onTabChange: (index) {
provider.changeScreen(index);
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
