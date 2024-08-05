import 'dart:async';

import 'package:flutter/material.dart';

class CallProvider extends ChangeNotifier {
  bool _isSpeaker = false;
  bool _isMute = false;

  bool get isSpeaker => _isSpeaker;
  bool get isMute => _isMute;

  void setSpeaker(bool speak) {
    _isSpeaker = speak;
    notifyListeners();
  }

  void setMute(bool mute) {
    _isMute = mute;
    notifyListeners();
  }

  Duration _callDuration = Duration.zero;
  Timer? _timer;

  Duration get callDuration => _callDuration;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _callDuration += const Duration(seconds: 1);
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _callDuration = Duration.zero; // Reset duration when stopped
  }

  String get formattedDuration {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(_callDuration.inMinutes.remainder(60));
    final seconds = twoDigits(_callDuration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
