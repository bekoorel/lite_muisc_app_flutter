import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';

class Player extends ChangeNotifier {
  final audioPlayer = getIt<AudioPlayer>();
  final fitchAudiosGitIt = getIt<FitchAudios>();
  int indexed = 0;
  bool isPlaying = true;
  Duration duration = const Duration();
  Duration position = const Duration();

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

  void seekBar(double value) {
    final position = Duration(seconds: value.toInt());
    audioPlayer.seek(position);
    notifyListeners();
  }
}
