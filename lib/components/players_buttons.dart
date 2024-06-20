import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/player_logic.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({super.key});

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  final isPlayerGet = getIt<AudioPlayer>();
  final playerClassGet = getIt<Player>();
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    isPlayerGet.onPlayerStateChanged.listen((PlayerState s) {
      isPlaying = (s == PlayerState.playing);
    });
    isPlayerGet.onPlayerComplete.listen((event) {
      print('Audio has completed playing.');
      int up = playerClassGet.indexed;
      up++;
      print('------------${playerClassGet.indexed}');
      print('..............${up}');
      playerClassGet.setSoures(up);
      print('/////////////${playerClassGet.indexed}');
      playerClassGet.resumeSong();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            int dowen = playerClassGet.indexed;
            dowen--;
            print('${playerClassGet.indexed}');
            print('${dowen}');
            playerClassGet.setSoures(dowen);
            print('${playerClassGet.indexed}');
            playerClassGet.resumeSong();
          },
          icon: Icon(
            Icons.skip_previous_sharp,
            color: ColorsApp.lightOrang,
          ),
        ),
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
        IconButton(
          onPressed: () {
            int up = playerClassGet.indexed;
            up++;
            print('------------${playerClassGet.indexed}');
            print('..............${up}');
            playerClassGet.setSoures(up);
            print('/////////////${playerClassGet.indexed}');
            playerClassGet.resumeSong();
          },
          icon: Icon(
            Icons.skip_next_sharp,
            color: ColorsApp.lightOrang,
          ),
        ),
      ],
    );
  }
}
