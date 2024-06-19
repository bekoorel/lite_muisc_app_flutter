import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({super.key});

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  final isPlayerGet = getIt<AudioPlayer>();
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    isPlayerGet.onPlayerStateChanged.listen((PlayerState s) {
      isPlaying = (s == PlayerState.playing);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /*  IconButton(
        onPressed: () => Player.player('back'),
        icon: Icon(
          Icons.skip_previous_sharp,
          color: ColorsApp.lightOrang,
        ),
      ),*/
        IconButton(
          onPressed: () {
            isPlayerGet.onPlayerStateChanged.listen((PlayerState s) {
              isPlaying = (s == PlayerState.playing);
            });

            if (isPlaying) {
              isPlayerGet.pause();
            } else {
              isPlayerGet.resume();
            }
          },
          icon: Icon(
            Icons.play_arrow_sharp,
            color: ColorsApp.lightOrang,
          ),
        ),
        /* IconButton(
        onPressed: () => Player.player('next'),
        icon: Icon(
          Icons.skip_next_sharp,
          color: ColorsApp.lightOrang,
        ),
      ),*/
      ],
    );
  }
}
