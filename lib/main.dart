import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_player/history_page.dart';
import 'package:music_player/provider_events.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderEventList())
      ],
      child: ScreenUtilInit(
          designSize: const Size(395, 750),
          builder: (_, child) {
            return MaterialApp(title: 'Flutter Demo', home: HistoryPage());
          }),
    );
  }
}
