import 'dart:io';

//import 'package:path_provider/path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> permissionCheck() async {
  print('stsrt');
  if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        Permission.audio.request();
        Permission.storage.request();
        print('=<32');

        /// use [Permissions.storage.status]
      } else {
        print('else');

        /// use [Permissions.photos.status]
      }
   

    // permissionCheck();
  }
/*
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
  
  final Directory tempDir = await getTemporaryDirectory();

  final Directory appDocumentsDir = await getExternalStorageDirectories();

  */
}

