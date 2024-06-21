import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/logic/player_logic.dart';
import 'package:music_app/providers/providers.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:get_it/get_it.dart';

class AudioView extends StatelessWidget {
  AudioView({super.key});
  final playerGetIt = GetIt.instance<Player>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.2,
      child: Consumer(
        builder: (context, ref, child) => QueryArtworkWidget(
          artworkBorder: BorderRadius.circular(50),
          artworkFit: BoxFit.cover,
          id: ref.watch(playerNotifiy).songesData['ids']![playerGetIt.indexed],
          type: ArtworkType.AUDIO,
          nullArtworkWidget: const Icon(Icons.music_note_sharp, size: 600),
          size: 1000,
        ),
      ),
    );
  }
}
