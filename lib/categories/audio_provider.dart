import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioProvider with ChangeNotifier {
  bool isRepeating = false;
  late AudioPlayer _player;
  bool _playing = false;
  IconData _playBtn = Icons.play_circle_sharp;
  Duration _position = const Duration();
  Duration _musicLength = const Duration();
  String? _currentAudio;

  AudioProvider() {
    _player = AudioPlayer();
    _player.onDurationChanged.listen((d) {
      _musicLength = d;
      notifyListeners();
    });
    _player.onPositionChanged.listen((p) {
      _position = p;
      notifyListeners();
    });
    _player.onPlayerComplete.listen((event) {
      if (isRepeating && _currentAudio != null) {
        _player.play(AssetSource(_currentAudio!));
        _playBtn = Icons.pause;
        _playing = true;
      } else {
        _playBtn = Icons.play_circle_sharp;
        _playing = false;
        notifyListeners();
      }
    });
  }

  bool get playing => _playing;
  IconData get playBtn => _playBtn;
  Duration get position => _position;
  Duration get musicLength => _musicLength;

  void play(String audio) {
    _currentAudio = audio;
    if (!_playing) {
      _player.play(AssetSource(audio));
      _playBtn = Icons.pause;
      _playing = true;
    } else {
      _player.pause();
      _playBtn = Icons.play_circle_sharp;
      _playing = false;
    }
    notifyListeners();
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  void stop() {
    _player.stop();
    _playBtn = Icons.play_circle_sharp;
    _playing = false;
    notifyListeners();
  }

  void toggleRepeat() {
    isRepeating = !isRepeating;
    notifyListeners();
  }
}
