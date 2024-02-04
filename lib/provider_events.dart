import 'package:flutter/material.dart';

class ProviderEventList extends ChangeNotifier {
  bool isPlaying = false;
  Duration duration = Duration();
  Duration position = Duration();

  void setIsPlaying(bool value) {
    isPlaying = value;
    notifyListeners();
  }

  void setDuration(Duration value) {
    duration = value;
    notifyListeners();
  }

  void setPosition(Duration value) {
    position = value;
    notifyListeners();
  }
}
