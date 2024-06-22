import 'package:flutter/material.dart';
import 'package:music_app/consetns/consetens.dart';

class ScaningFiles extends StatelessWidget {
  final String not;
  const ScaningFiles({super.key, required this.not});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        not,
        style: TextStyle(color: ColorsApp.lightOrang),
      ),
    );
  }
}
