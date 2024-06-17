import 'package:audioplayers/audioplayers.dart';

List<Map> playList = [
  {'name': 'musicname', 'time': 2.25, 'path': 'c/file'}
];

class Player extends AudioPlayer {
  static int indexed = 0;
  static String name = 'غير محدد اسم';
  static String path = 'غير محدد مكان';
  static double duorashn = 0.0;

  void player(String statePlayer) {
    switch (statePlayer) {
      //............play
      case 'play':
        AudioPlayer().play(DeviceFileSource(playList[indexed]['path']));
        musicData();
        break;

      //...........stop
      case 'stop':
        AudioPlayer().stop();
        break;

      //...........next
      case 'next':
        AudioPlayer().stop();
        indexed++;
        AudioPlayer().play(DeviceFileSource(playList[indexed]['path']));
        musicData();
        break;

      //.........back
      case 'back':
        AudioPlayer().stop();
        indexed--;
        AudioPlayer().play(DeviceFileSource(playList[indexed]['path']));
        musicData();
        break;

//.........play from list
//يجب اضافه الانديكس خارجيا قبل عمل الداله
      case 'playfromlist':
        AudioPlayer().stop();

        AudioPlayer().play(DeviceFileSource(playList[indexed]['path']));
        musicData();
        break;
    }
  }

  void musicData() {
    name = playList[indexed]['name'];
    path = playList[indexed]['path'];
    duorashn = playList[indexed]['time'];
  }
}
