import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/components/player_widget.dart';
import 'package:music_app/consetns/consetens.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);

    // Start the player as soon as the app is displayed.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource('assats/ambient_c_motion.mp3'));
      await player.resume();
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();

    super.dispose();
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
              SizedBox(
                height: heightScreen * 0.3,
                width: widthScreen * 0.9,
                child: PlayerWidget(player: player),
              )
            ],
          ),
        ),
      ),
    );
  }
}
