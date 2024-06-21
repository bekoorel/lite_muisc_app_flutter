import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/providers/providers.dart';
import 'package:on_audio_query/on_audio_query.dart';

class DownList extends StatelessWidget {
  const DownList({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                style: TextStyle(color: ColorsApp.lightGray),
                decoration: InputDecoration(
                  hintText: 'Music Name',
                  hintStyle: TextStyle(color: ColorsApp.lightOrang),
                  border: const OutlineInputBorder(borderSide: BorderSide()),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Consumer(
                builder: (context, ref, child) => ListView.builder(
                  itemCount:
                      ref.watch(playerNotifiy).songesData['names']!.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ref.read(playerNotifiy).setSoures(index);
                      ref.read(playerNotifiy).resumeSong();
                    },
                    child: ListTile(
                      title: Text(
                        overflow: TextOverflow.visible,
                        ref.watch(playerNotifiy).songesData['names']![index],
                        style: TextStyle(
                          color: ref.watch(playerNotifiy).indexed == index
                              ? ColorsApp.lightOrang
                              : ColorsApp.lightGray,
                          fontSize: ScreenUtil().setSp(10),
                        ),
                      ),
                      trailing: QueryArtworkWidget(
                        id: ref.watch(playerNotifiy).songesData['ids']![index],
                        type: ArtworkType.AUDIO,
                        nullArtworkWidget: const Icon(Icons.music_note_sharp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
