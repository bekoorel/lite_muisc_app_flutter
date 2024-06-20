import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/player_logic.dart';
import 'package:on_audio_query/on_audio_query.dart';

class DownList extends StatelessWidget {
  DownList({super.key});
  final playerGetIt = getIt<Player>();
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 100, 8, 8),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsApp.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: playerGetIt.songesData['names']!.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                playerGetIt.setSoures(index);
                playerGetIt.resumeSong();
              },
              child: ListTile(
                title: Text(
                  overflow: TextOverflow.visible,
                  playerGetIt.songesData['names']![index],
                  style: TextStyle(
                    color: playerGetIt.songesData['names']![index] == index
                        ? ColorsApp.lightOrang
                        : ColorsApp.lightGray,
                    fontSize: ScreenUtil().setSp(10),
                  ),
                ),
                trailing: QueryArtworkWidget(
                  id: playerGetIt.songesData['ids']![index],
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: const Icon(Icons.music_note_sharp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
