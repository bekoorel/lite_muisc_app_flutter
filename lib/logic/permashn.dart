import 'package:flutter/foundation.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';
import 'package:permission_handler/permission_handler.dart';

class PermashnApp extends ChangeNotifier {
  final fitchAudiosGitIt = getIt<FitchAudios>();
  permission() async {
    try {
      var permstorage = await Permission.storage.request();
      if (permstorage.isGranted) {
        // print('sucses perm');

        await fitchAudiosGitIt.audios();
      } else {
        //  print('false perm');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
