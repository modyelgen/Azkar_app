import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constant.dart';
class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key,required this.onTap,required this.index});
  final void Function(int)? onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      currentIndex: index,
      onTap: onTap,
      items:  [
        const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house),label: 'Home'),
        const BottomNavigationBarItem(icon:Icon( FontAwesomeIcons.bookOpen,),label: 'azkar'),
        BottomNavigationBarItem(icon:Image.asset('assets/images/beads_2.png',height: 25,),label: 'sebha'),
      ],
    );
  }

}
