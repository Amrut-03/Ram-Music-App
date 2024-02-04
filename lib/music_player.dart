import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/bottom_nav.dart';
import 'package:music_player/music_page.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isPast = true;
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'Music Library',
            style: GoogleFonts.ubuntu(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Hamare Sath Shree Raghunath',
                  subtitle: 'Agam Aggarwal',
                  thumbnail: 'images/ram.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Hamare Sath Shree Raghunath',
                                  subtitle: 'Agam Aggarwal',
                                  thumbnail: 'images/ram.jpg',
                                  music: 'ram_2.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'He Ram He Ram',
                  subtitle: 'Jagjit Singh',
                  thumbnail: 'images/he_ram_he_ram.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'He Ram He Ram',
                                  subtitle: 'Jagjit Singh',
                                  thumbnail: 'images/he_ram_he_ram.jpg',
                                  music: 'Hey_Ram_Hey_Ram.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Raghupati Raghava Rajaram',
                  subtitle: 'Kavita Raam',
                  thumbnail: 'images/raghupati_raghav.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Raghupati Raghava Rajaram',
                                  subtitle: 'Kavita Raam',
                                  thumbnail: 'images/raghupati_raghav.jpg',
                                  music: 'Raghupati_Raghav_Raja_Ram.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Ram Ayenge',
                  subtitle: 'Swati Mishra',
                  thumbnail: 'images/ram_ayenge.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Ram Ayenge',
                                  subtitle: 'Swati Mishra',
                                  thumbnail: 'images/ram_ayenge.jpg',
                                  music: 'Ram_Aayenge.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Ram_Siya_Ram',
                  subtitle: 'Sachet Tandon',
                  thumbnail: 'images/ram_siya_ram.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Ram_Siya_Ram',
                                  subtitle: 'Sachet Tandon',
                                  thumbnail: 'images/ram_siya_ram.jpg',
                                  music: 'Ram_Siya_Ram.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Mere Ghar Ram Aye Hain',
                  subtitle: 'Jubin Nautiyal, Payel dev',
                  thumbnail: 'images/mere_ghar_ram_aye_hain.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Mere Ghar Ram Aye Hain',
                                  subtitle: 'Jubin Nautiyal, Payel dev',
                                  thumbnail:
                                      'images/mere_ghar_ram_aye_hain.jpg',
                                  music: 'Mere_Ghar_Ram_Aaye_Hain.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Ram Ram Jai Raja Ram',
                  subtitle: 'Shankar Mahadevan',
                  thumbnail: 'images/ram_ram_jai_raja_ram.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Ram Ram Jai Raja Ram',
                                  subtitle: 'Shankar Mahadevan',
                                  thumbnail: 'images/ram_ram_jai_raja_ram.jpg',
                                  music: 'Ram_Ram_Jai_Raja.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
              Music_tile(
                  title: 'Ramayan Choipaya',
                  subtitle: 'kumar vishu',
                  thumbnail: 'images/shri_ram_20.jpg',
                  onClick: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MusicPage(
                                  title: 'Ramayan Choipaya',
                                  subtitle: 'kumar vishu',
                                  thumbnail: 'images/shri_ram_20.jpg',
                                  music: 'Ramayan_Chaupai_.mp3',
                                )));
                  }),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}

class Music_tile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String thumbnail;
  final VoidCallback onClick;
  const Music_tile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.thumbnail,
    required this.onClick,
  });

  @override
  State<Music_tile> createState() => _Music_tileState();
}

class _Music_tileState extends State<Music_tile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onClick(),
      child: Container(
        height: 80,
        width: 370,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  widget.thumbnail,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              widget.title,
              style: GoogleFonts.ubuntu(color: Colors.white),
            ),
            subtitle: Text(
              widget.subtitle,
              style: GoogleFonts.ubuntu(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
