import 'package:get_it/get_it.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_app/logic/chack_audio_files.dart';
import 'package:music_app/logic/permashn.dart';
import 'package:music_app/logic/player_logic.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<AudioPlayer>(AudioPlayer());
  getIt.registerSingleton<FitchAudios>(FitchAudios());
  getIt.registerSingleton<PermashnApp>(PermashnApp());
  getIt.registerSingleton<Player>(Player());
}
