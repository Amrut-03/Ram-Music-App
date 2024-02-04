import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String thumbnail;
  final String music;
  const MusicPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.thumbnail,
      required this.music});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late AudioPlayer audioplayer;
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isSliderDragging = false;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    audioplayer = AudioPlayer();
    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioplayer.onPositionChanged.listen((newposition) {
      setState(() {
        position = newposition;
      });
    });
  }

  @override
  void dispose() {
    audioplayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.deepOrange, Colors.black],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            height: 500,
            width: 370,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.deepOrange, width: 2),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          widget.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    widget.title,
                    style:
                        GoogleFonts.ubuntu(fontSize: 20, color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    widget.subtitle,
                    style:
                        GoogleFonts.ubuntu(fontSize: 15, color: Colors.white),
                  ),
                ),
                Slider(
                  min: 0,
                  activeColor: Colors.deepOrange,
                  inactiveColor: Colors.white,
                  max: duration.inSeconds.toDouble(),
                  value: isSliderDragging
                      ? position.inSeconds.toDouble()
                      : position.inSeconds
                          .toDouble()
                          .clamp(0, duration.inSeconds)
                          .toDouble(),
                  onChanged: (value) {
                    setState(() {
                      isSliderDragging = true;
                      position = Duration(seconds: value.toInt());
                    });
                  },
                  onChangeEnd: (value) async {
                    final newPositionSeconds =
                        value.toInt().clamp(0, duration.inSeconds);
                    final newPosition = Duration(seconds: newPositionSeconds);

                    await audioplayer.seek(newPosition);
                    setState(() {
                      position = newPosition;
                      isSliderDragging = false;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime(position),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          formatTime(duration - position),
                          style: TextStyle(color: Colors.white),
                        ),
                      ]),
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  maxRadius: 35,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 45,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioplayer.pause();
                          } else {
                            String path = widget.music;
                            await audioplayer.play(AssetSource(path));
                          }
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
