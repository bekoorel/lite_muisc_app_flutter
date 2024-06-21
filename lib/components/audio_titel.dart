import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/providers/providers.dart';
import 'package:text_scroll/text_scroll.dart';

class AudioTitel extends StatelessWidget {
  const AudioTitel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => TextScroll(
        ref
            .watch(playerNotifiy)
            .songesData['names']![ref.watch(playerNotifiy).indexed],
        mode: TextScrollMode.endless,
        velocity: const Velocity(
          pixelsPerSecond: Offset(150, 0),
        ),
        delayBefore: const Duration(milliseconds: 500),
        numberOfReps: 5,
        pauseBetween: const Duration(milliseconds: 50),
        style: TextStyle(
            fontWeight: FontWeight.w600,
            color: ColorsApp.lightGray,
            fontSize: 25.sp),
        textAlign: TextAlign.right,
        selectable: true,
      ),
    );
  }
}
