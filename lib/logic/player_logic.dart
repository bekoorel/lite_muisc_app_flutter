import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<Map<String, String>>> getAllAudioFiles() async {
  // طلب إذن الوصول إلى التخزين
  if (!await Permission.storage.request().isGranted) {
    return [];
  }

  // الحصول على دليل التخزين الخارجي
  Directory? externalStorageDirectory = await getExternalStorageDirectory();
  if (externalStorageDirectory == null) {
    return [];
  }

  // البحث عن الملفات الصوتية
  List<FileSystemEntity> files = externalStorageDirectory.listSync(recursive: true);
  List<Map<String, String>> audioFiles = files.where((file) {
    String filePath = file.path.toLowerCase();
    return filePath.endsWith('.mp3') || filePath.endsWith('.wav') || filePath.endsWith('.m4a') || filePath.endsWith('.aac');
  }).map((file) {
    return {
      'path': file.path,
      'name': file.path.split('/').last
    };
  }).toList();

  return audioFiles;
}
