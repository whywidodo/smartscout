import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:audioplayers/audioplayers.dart';

class TombolPlay extends StatefulWidget {
  const TombolPlay({Key? key}) : super(key: key);

  @override
  _TombolPlayState createState() => _TombolPlayState();
}

bool statusPlay = false;

class _TombolPlayState extends State<TombolPlay> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: statusPlay
                ? Icon(Icons.stop, color: warnaUngu)
                : Icon(Icons.play_arrow_rounded, color: warnaUngu),
            onPressed: () async {
                final player = AudioPlayer();
                await player.play(AssetSource('assets/audio/morse/cekmorse.wav'));
                setState(() {
                  statusPlay = !statusPlay;
                });
            }),
      ],
    );
  }
}
