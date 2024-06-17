


import 'dart:io';
List<String> musicFiles = [];
getAllAudioFilesMusic() async {
  print('start fetsh');
  Directory? musicDirectory =Directory('/storage/emulated/0/Android/media'); //await getDownloadsDirectory();
  //await getExternalStorageDirectory();
  print(musicDirectory);
  print('.............1');
  List<FileSystemEntity> files =
      musicDirectory.listSync(recursive: Platform.isAndroid);

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
