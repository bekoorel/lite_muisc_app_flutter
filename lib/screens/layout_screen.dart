import 'package:flutter/material.dart';
import 'package:music_app/components/audio_titel.dart';
import 'package:music_app/components/circulr_audio_view.dart';
import 'package:music_app/components/dwon_list.dart';
import 'package:music_app/components/players_buttons.dart';
import 'package:music_app/consetns/consetens.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AudioTitel(),
        const SizedBox(
          height: 30.0,
        ),
        Expanded(
          flex: 2,
          child: AudioView(),
        ),
        const Expanded(
          child: PlayerButtons(),
        ),
        Expanded(
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              // Check the direction of the drag
              if (details.delta.dy < 0) {
                // Swipe up action
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.cancel_outlined)),
                    contentPadding: EdgeInsets.zero,
                    backgroundColor: ColorsApp.black.withOpacity(1),
                    content: const DownList(),
                  ),
                );
              }
            },
            child: Icon(
              Icons.keyboard_arrow_up_rounded,
              color: ColorsApp.lightGray,
              size: 60,
            ),
          ),
        ),
      ],
    );
  }
}
