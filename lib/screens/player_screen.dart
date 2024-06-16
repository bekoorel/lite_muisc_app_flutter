//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/logic/player_logic.dart';
import 'package:permission_handler/permission_handler.dart' as reco;

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  // final _audioPlayer = AudioPlayer();
  @override
  initState() {
    super.initState();
    reco.Permission.audio.request();
    // permissionCheck();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: heightScreen,
          width: widthScreen,
          decoration: BoxDecoration(gradient: ColorsApp.gradientBlack),
          child: Column(
            children: [
              SizedBox(
                height: heightScreen * 0.02,
              ),
              Text(
                'musaic app',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.lightGray,
                    fontSize: 35),
              ),
              SizedBox(
                height: heightScreen * 0.02,
              ),
              Container(
                height: heightScreen * 0.5,
                width: widthScreen * 0.7,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsApp.gray,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: ColorsApp.lightGray,
                          offset: const Offset(1.0, 1.0),
                          blurRadius: 30.0)
                    ]),
              ),
              TextButton(
                  onPressed: () {
                    // print('${_audioFiles.length}');
                    // print('${_audioFiles[0]['name'] ?? 'Unknown'}');
                    permissionCheck();
                  },
                  child: const Text('data')),
              Container(
                color: Colors.amber,
                height: heightScreen * 0.1,
                width: widthScreen * 0.9,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text('564646'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
