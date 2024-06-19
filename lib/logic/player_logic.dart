import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';

class Player extends ChangeNotifier {
  final audioPlayer = getIt<AudioPlayer>();
  final fitchAudiosGitIt = getIt<FitchAudios>();
  int get indexed => 0;
  Map<String, List<dynamic>> get songesData {
    return fitchAudiosGitIt.audioMap;
  }

  play(int ixplay) {
    try {
      audioPlayer.play(DeviceFileSource(songesData['uris']![ixplay]));
      print(
          'الرقم المختار من القائمه $ixplay-------${songesData['uris']![ixplay]}----');
    } catch (e) {
      print(e);
    }
  }

  pauseSong() => audioPlayer.pause();
  resumeSong() => audioPlayer.resume();
}


/*

String path = 'file:///storage/FF3D-FD87/snaptube/download/SnapTube Audio/ويجز - بعودة يا بلادي _ (official music remix)(MP3_320K).mp3';
String fullPath = 'file://$path';*/