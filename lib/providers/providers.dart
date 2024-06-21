import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';
import 'package:music_app/logic/permashn.dart';
import 'package:music_app/logic/player_logic.dart';

final playerNotifiy = ChangeNotifierProvider(
  (ref) => getIt<Player>(),
);

final fitchAudiosNotifiy = ChangeNotifierProvider(
  (ref) => getIt<FitchAudios>(),
);

final permashnAppNotifiy = ChangeNotifierProvider(
  (ref) => getIt<PermashnApp>(),
);
