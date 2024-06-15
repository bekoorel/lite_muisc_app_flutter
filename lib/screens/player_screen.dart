import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/logic/player_logic.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final _audioPlayer = AudioPlayer();
  List<Map<String, String>> _audioFiles = [];

  @override
  void initState() {
    super.initState();
    _fetchAudioFiles();
  }

  Future<void> _fetchAudioFiles() async {
    List<Map<String, String>> files = await getAllAudioFiles();
    setState(() {
      _audioFiles = files;
    });
  }

  void _playSound(String filePath) async {
    await _audioPlayer.play(DeviceFileSource(filePath));
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
              Container(
                color: Colors.amber,
                height: heightScreen * 0.3,
                width: widthScreen * 0.9,
                child: ListView.builder(
                  itemCount: _audioFiles.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_audioFiles[index]['name'] ?? 'Unknown',
                          style: TextStyle(color: Colors.blue)),
                      onTap: () => _playSound(_audioFiles[index]['path']!),
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
