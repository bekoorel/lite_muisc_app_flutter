import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FitchAudios {
  final getItAudioClass = getIt<AudioPlayer>();
  Map<String, List<dynamic>> audioMap = {
    'names': [],
    'uris': [],
    'ids': [],
  };

  Future<Map<String, List<dynamic>>> audios() async {
    final List<String> formats = ['mp3', 'wav', 'ogg', 'aac'];
    final List<SongModel> allSongs = await OnAudioQuery().querySongs();

    audioMap = {
      'names': [],
      'uris': [],
      'ids': [],
    };

    for (SongModel song in allSongs) {
      if (isSupportedFormat(song.data, formats)) {
        int? duration = song.duration;
        if (duration! >= 50000) {
          audioMap['names']?.add(song.title);
          audioMap['uris']?.add(song.data);
          audioMap['ids']?.add(song.id);
          print('مسار الاغنيه :--${song.data}');
        }
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
