import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/player_logic.dart';
import 'package:music_app/providers/providers.dart';

class PlayerButtons extends StatefulWidget {
  const PlayerButtons({super.key});

  @override
  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  final isPlayerGet = getIt<AudioPlayer>();
  final playerClassGet = getIt<Player>();

  @override
  void initState() {
    super.initState();
    isPlayerGet.onPlayerStateChanged.listen((PlayerState s) {
      playerClassGet.isPlaying = (s == PlayerState.playing);
    });
    isPlayerGet.onPlayerComplete.listen((event) {
      int up = playerClassGet.indexed;
      up++;
      playerClassGet.setSoures(up);
      playerClassGet.resumeSong();
    });
    // Configure the player
    isPlayerGet.onDurationChanged.listen((Duration d) {
      setState(() {
        playerClassGet.duration = d;
      });
    });

    isPlayerGet.onPositionChanged.listen((Duration p) {
      setState(() {
        playerClassGet.position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 1.5,
          height: MediaQuery.sizeOf(context).height / 7,
          child: Consumer(builder: (context, ref, child) {
            return Slider(
              value: ref.watch(playerNotifiy).position.inSeconds.toDouble(),
              min: 0.0,
              max: ref.watch(playerNotifiy).duration.inSeconds.toDouble(),
              onChanged: (double value) {
                ref.read(playerNotifiy).seekBar(value);
              },
            );
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(
              builder: (context, ref, child) => IconButton(
                onPressed: () {
                  int dowen = ref.watch(playerNotifiy).indexed;
                  dowen--;
                  ref.read(playerNotifiy).setSoures(dowen);
                  ref.read(playerNotifiy).resumeSong();
                },
                icon: Icon(
                  Icons.skip_previous_sharp,
                  color: ColorsApp.lightOrang,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => IconButton(
                onPressed: () {
                  isPlayerGet.onPlayerStateChanged.listen(
                    (PlayerState s) {
                      ref.read(playerNotifiy).isPlaying =
                          (s == PlayerState.playing);
                    },
                  );
                  if (ref.watch(playerNotifiy).isPlaying) {
                    ref.read(playerNotifiy).pauseSong();
                  } else {
                    ref.read(playerNotifiy).resumeSong();
                  }
                },
                icon: Icon(
                  ref.watch(playerNotifiy).isPlaying
                      ? Icons.play_arrow_sharp
                      : Icons.pause,
                  color: ColorsApp.lightOrang,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) => IconButton(
                onPressed: () {
                  int up = ref.watch(playerNotifiy).indexed;
                  up++;
                  ref.read(playerNotifiy).setSoures(up);
                  ref.read(playerNotifiy).resumeSong();
                },
                icon: Icon(
                  Icons.skip_next_sharp,
                  color: ColorsApp.lightOrang,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
