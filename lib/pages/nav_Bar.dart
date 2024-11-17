import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_player/pages/history_page.dart';
import 'package:music_player/pages/music_Library.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List pages = [HistoryPage(), MusicPlayer()];

  int current_page_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
          backgroundColor: Colors.transparent,
          color: Colors.black,
          onTap: (index) async {
            setState(() {
              current_page_index = index;
            });
          },
          items: [
            Icon(Icons.newspaper, color: Colors.white),
            Icon(Icons.music_note, color: Colors.white),
          ]),
      body: pages[current_page_index],
    );
  }
}
