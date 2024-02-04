import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/bottom_nav.dart';
import 'package:music_player/history_list.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
          ])),
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(isPast: isPast),
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
        body: Center(
            child: Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
        )),
      ),
    );
  }
}

class TimeLineItems extends StatefulWidget {
  final bool isFirst;
  final bool islast;
  final String title;
  final String description;
  final String photo;
  final String title2;
  const TimeLineItems({
    super.key,
    required this.isFirst,
    required this.islast,
    required this.title,
    required this.description,
    required this.photo,
    required this.title2,
  });

  @override
  State<TimeLineItems> createState() => _TimeLineItemsState();
}

class _TimeLineItemsState extends State<TimeLineItems> {
  bool isTap = true;
  @override
  void initState() {
    isTap = false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: widget.isFirst,
      isLast: widget.islast,
      afterLineStyle: LineStyle(thickness: 5, color: Colors.black),
      beforeLineStyle: LineStyle(thickness: 5, color: Colors.black),
      indicatorStyle: IndicatorStyle(
          iconStyle: IconStyle(
              iconData: isTap
                  ? Icons.arrow_forward_ios_sharp
                  : Icons.arrow_downward_sharp,
              color: Colors.white),
          color: Colors.black,
          width: 40),
      endChild: isTap
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTap = false;
                  });
                },
                child: Container(
                    height: 450,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 180,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ),
                        Text(
                          widget.title,
                          style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.description,
                            style: GoogleFonts.ubuntu(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ))
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTap = true;
                  });
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      widget.title2,
                      style: GoogleFonts.ubuntu(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
