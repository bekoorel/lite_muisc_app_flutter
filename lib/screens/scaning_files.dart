import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';

class ScaningFiles extends StatelessWidget {
  const ScaningFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Scaning Your Music Files',
        style: TextStyle(color: ColorsApp.lightOrang),
      ),
    );
  }
}
