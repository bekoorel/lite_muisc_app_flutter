import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/consetns/consetens.dart';
import 'package:music_app/consetns/get_it.dart';
import 'package:music_app/logic/permashn.dart';
import 'package:music_app/providers/providers.dart';
import 'package:music_app/screens/layout_screen.dart';
import 'package:music_app/screens/scaning_files.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final permGetit = getIt<PermashnApp>();

  @override
  void initState() {
    super.initState();
    permGetit.permission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightOrang,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: ColorsApp.gradientBlack),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Consumer(builder: (context, ref, child) {
              if (ref.watch(fitchAudiosNotifiy).audioMap['names'] == null) {
                return const ScaningFiles(
                  not: 'No Music In Your Device',
                );
              } else {
                if (ref.watch(fitchAudiosNotifiy).audioMap['names']!.isEmpty) {
                  return const ScaningFiles(not: 'Scaning Music');
                } else {
                  return const LayoutScreen();
                }
              }
            }),
          ),
        ),
      ),
    );
  }
}
