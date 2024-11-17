import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/widgets/history_list.dart';
import 'package:music_player/widgets/timeline.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  bool isPast = true;

  @override
  void initState() {
    isPast = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepOrange,
            Colors.black,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text(
            'History of Ram Mandir',
            style: GoogleFonts.ubuntu(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Colors.black,
                  ),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TimeLineItems(
                  isFirst: true,
                  islast: false,
                  title: historyList.historyData[0].title,
                  description: historyList.historyData[0].description,
                  photo: 'images/old_temple.jpeg',
                  title2: historyList.historyData[0].title,
                ),
                TimeLineItems(
                    isFirst: false,
                    islast: false,
                    title: historyList.historyData[1].title,
                    description: historyList.historyData[1].description,
                    photo: 'images/babari.jpeg',
                    title2: historyList.historyData[1].title),
                TimeLineItems(
                    isFirst: false,
                    islast: false,
                    title: historyList.historyData[2].title,
                    description: historyList.historyData[2].description,
                    photo: 'images/battle.jpeg',
                    title2: historyList.historyData[2].title),
                TimeLineItems(
                    isFirst: false,
                    islast: false,
                    title: historyList.historyData[3].title,
                    description: historyList.historyData[3].description,
                    photo: 'images/proofs.jpeg',
                    title2: historyList.historyData[3].title),
                TimeLineItems(
                    isFirst: false,
                    islast: true,
                    title: historyList.historyData[4].title,
                    description: historyList.historyData[4].description,
                    photo: 'images/ram_mandir.jpg',
                    title2: historyList.historyData[4].title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
