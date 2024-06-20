//import 'package:audioplayers/audioplayers.dart';
//import 'package:music_app/consetns/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

class FitchAudios {
  // final getItAudioClass = getIt<AudioPlayer>();
  Map<String, List<dynamic>> audioMap = {
    'names': [],
    'uris': [],
    'ids': [],
  };

  // Method to fetch and populate the map
  Future<Map<String, List>> audios() async {
    final List<SongModel> data = await OnAudioQuery().querySongs();

    // Create an instance of FitchAudios
    //FitchAudios fitchAudios = FitchAudios();

    // Populate the map with data
    for (SongModel song in data) {
      audioMap['names']?.add(song.title);
      audioMap['uris']?.add(song.data); // Handle null URI
      audioMap['ids']?.add(song.id);
      print('مسار الاغنيه :--${song.data}');
    }
    return audioMap;
  }
/*
  Future getDuration(String uri) async {
    await getItAudioClass.setSourceDeviceFile(uri);
    return await getItAudioClass.getDuration();
  }*/
}
