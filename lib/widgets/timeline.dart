import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
      afterLineStyle: const LineStyle(thickness: 5, color: Colors.black),
      beforeLineStyle: const LineStyle(thickness: 5, color: Colors.black),
      indicatorStyle: IndicatorStyle(
          iconStyle: IconStyle(
              iconData: isTap
                  ? Icons.arrow_forward_ios_sharp
                  : Icons.arrow_downward_sharp,
              color: Colors.white),
          color: Colors.black,
          width: 40.w),
      endChild: isTap
          ? Padding(
              padding: EdgeInsets.all(10.w),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTap = false;
                  });
                },
                child: Container(
                    height: 500.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.black,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Container(
                            height: 180.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.asset(
                                widget.photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ubuntu(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Text(
                            widget.description,
                            style: GoogleFonts.ubuntu(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ))
          : Padding(
              padding: EdgeInsets.all(8.w),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTap = true;
                  });
                },
                child: Container(
                  height: 50.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      widget.title2,
                      style: GoogleFonts.ubuntu(
                          fontSize: 15.sp,
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
