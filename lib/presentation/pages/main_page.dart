import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:muslim/presentation/pages/settings_page.dart';
import 'package:muslim/presentation/presentation.dart';
import 'package:muslim/presentation/utils/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    SettingsPage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedLabelStyle: blackTextRegular.copyWith(
          color: primaryColor,
        ),
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        unselectedLabelStyle: whiteTextRegular,
        items: [
          BottomNavigationBarItem(icon: LineIcon.home(), label: 'Home'),
          BottomNavigationBarItem(icon: LineIcon.heart(), label: 'Favorit'),
          BottomNavigationBarItem(icon: LineIcon.adjust(), label: 'Setting'),
        ],
      ),
    );
  }
}
