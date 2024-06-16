import 'dart:io';

//import 'package:path_provider/path_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

List<String> musicFiles = [];
Future<void> permissionCheck() async {
  print('stsrt');

  var status = await Permission.storage.status;

  if (!status.isGranted) {
    print('use prm');
    var pr = await Permission.audio.request();
    print(pr);
  }

  // طلب إذن الوصول إلى التخزين
  if (status.isGranted) {
    print('isGranted');
    await getAllAudioFilesMusic();
  } else {
    print('no per');
  }
  /*
  final Directory tempDir = await getTemporaryDirectory();

  final Directory appDocumentsDir = await getExternalStorageDirectories();

  */
}

getAllAudioFilesMusic() async {
  print('start fetsh');
  Directory? musicDirectory =Directory('/storage/emulated/0/Android/media'); //await getDownloadsDirectory();
  //await getExternalStorageDirectory();
  print(musicDirectory);
  print('.............1');
  List<FileSystemEntity> files =
      musicDirectory.listSync(recursive: Platform.isAndroid);
  print('.............2');

  print('.............3');
  print(files);
  for (FileSystemEntity entity in files) {
    print('.............4');
    String path = entity.path;
    if (path.endsWith('.mp3') ||
        path.endsWith('.m4a') ||
        path.endsWith('.wav')) {
      musicFiles.add(path);

    }
    print(musicFiles);
  }
}
