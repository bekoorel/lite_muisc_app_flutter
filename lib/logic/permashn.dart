import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/chack_audio_files.dart';
import 'package:permission_handler/permission_handler.dart';

class PermashnApp {
  final fitchAudiosGitIt = getIt<FitchAudios>();
  permission() async {
    var permstorage = await Permission.storage.request();
    if (permstorage.isGranted) {
      print('sucses perm');

      await fitchAudiosGitIt.audios();
    } else {
      print('false perm');
    }
  }
}
