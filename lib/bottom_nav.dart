import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/history_page.dart';
import 'package:music_player/music_player.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.isPast,
  });

  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
            //border: Border.all(color: Colors.deepOrange, width: 2),
            color: Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryPage()));
                      },
                      icon: Icon(
                        Icons.newspaper,
                        size: 30,
                        color: isPast ? Colors.white : Colors.deepOrange,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MusicPlayer()));
                      },
                      icon: Icon(
                        Icons.music_note,
                        size: 30,
                        color: isPast ? Colors.deepOrange : Colors.white,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
