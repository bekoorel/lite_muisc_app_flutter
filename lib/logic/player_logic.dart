import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';

class Player extends ChangeNotifier {
  final audioPlayer = getIt<AudioPlayer>();
  final fitchAudiosGitIt = getIt<FitchAudios>();
  int indexed = 0;
  bool isPlaying = true;

  Map<String, List<dynamic>> get songesData {
    return fitchAudiosGitIt.audioMap;
  }

  setSoures(int ixplay) {
    int length = songesData['uris']!.length;
    if (ixplay < 0) {
      indexed = length - 1;
    } else if (ixplay >= length) {
      indexed = 0;
    } else {
      indexed = ixplay;
    }
    audioPlayer.setSourceDeviceFile(songesData['uris']![indexed]);
    notifyListeners();
  }

  pauseSong() {
    audioPlayer.pause();
    notifyListeners();
  }

  resumeSong() {
    audioPlayer.resume();
    notifyListeners();
  }

  stopSong() => audioPlayer.stop();
  disposSong() => audioPlayer.dispose();
}


/*

String path = 'file:///storage/FF3D-FD87/snaptube/download/SnapTube Audio/ويجز - بعودة يا بلادي _ (official music remix)(MP3_320K).mp3';
String fullPath = 'file://$path';*/