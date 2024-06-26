import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FitchAudios extends ChangeNotifier {
  final getItAudioClass = getIt<AudioPlayer>();
  Map<String, List<dynamic>> audioMap = {
    'names': [],
    'uris': [],
    'ids': [],
    'duration': [],
  };

  Future<Map<String, List<dynamic>>> audios() async {
    try {
      final List<String> formats = ['mp3', 'wav', 'ogg', 'aac'];
      final List<SongModel> allSongs = await OnAudioQuery().querySongs();

      for (SongModel song in allSongs) {
        if (isSupportedFormat(song.data, formats)) {
          int? duration = song.duration;
          if (duration! >= 50000) {
            audioMap['names']?.add(song.title);
            audioMap['uris']?.add(song.data);
            audioMap['ids']?.add(song.id);
            audioMap['duration']?.add(song.duration);
          }
        }
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return audioMap;
  }

  bool isSupportedFormat(String uri, List<String> formats) {
    String uriLower = uri.toLowerCase();
    for (String format in formats) {
      if (uriLower.endsWith(format)) {
        return true;
      }
    }
    return false;
  }
}
