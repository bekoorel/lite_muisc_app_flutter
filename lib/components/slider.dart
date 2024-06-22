/*

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Music Player with Slider')),
        body: MusicPlayer(),
      ),
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer _audioPlayer;
  Duration _duration = Duration();
  Duration _position = Duration();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Configure the player
    _audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() {
        _duration = d;
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        _position = p;
      });
    });
  }

  void _play() async {
    int result = await _audioPlayer.play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
    if (result == 1) {
      // Success
    }
  }

  void _pause() async {
    int result = await _audioPlayer.pause();
    if (result == 1) {
      // Success
    }
  }

  void _seek(double value) {
    final position = Duration(seconds: value.toInt());
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          value: _position.inSeconds.toDouble(),
          min: 0.0,
          max: _duration.inSeconds.toDouble(),
          onChanged: (double value) {
            setState(() {
              _seek(value);
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: _play,
            ),
            IconButton(
              icon: Icon(Icons.pause),
              onPressed: _pause,
            ),
          ],
        ),
        Text(
          "${_position.inMinutes}:${_position.inSeconds.remainder(60).toString().padLeft(2, '0')}"
          " / "
          "${_duration.inMinutes}:${_duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
        ),
      ],
    );
  }
}
*/