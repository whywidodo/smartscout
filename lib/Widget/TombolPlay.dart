import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:audioplayers/audioplayers.dart';

class TombolPlay extends StatefulWidget {
  const TombolPlay({Key? key}) : super(key: key);

  @override
  _TombolPlayState createState() => _TombolPlayState();
}


class _TombolPlayState extends State<TombolPlay> {
  final player = AudioPlayer();
  bool statusPlay = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState(){
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        statusPlay = state == PlayerState.playing;
      });
    });
  }

  @override
  void dispose(){
    player.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: statusPlay
                ? Icon(Icons.stop, color: warnaUngu)
                : Icon(Icons.play_arrow_rounded, color: warnaUngu),
            onPressed: () async {
                // final player = AudioPlayer();
                // await player.play(AssetSource('assets/audio/morse/cekmorse.wav'));
                // setState(() {
                //   statusPlay = !statusPlay;
                // });
                if(statusPlay){
                  if(suara == true){
                    await player.stop();
                  }
                  await player.stop();
                }else{
                  // String url = 'assets/audio/morse/cekmorse.wav';
                  await player.play(AssetSource('audio/morse/cekmorse.wav'));
                  suara = true;
                }

              // String audioasset = "assets/audio/ambulance_sound.mp3";
              // ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
              // Uint8List  soundbytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
              // int result = await player.play(soundbytes);
              // if(result == 1){ //play success
              //   print("Sound playing successful.");
              // }else{
              //   print("Error while playing sound.");
              // }
            }),
      ],
    );
  }
}
