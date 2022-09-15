import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';

class OldMorse extends StatefulWidget {
  const OldMorse({Key? key}) : super(key: key);

  @override
  _OldMorseState createState() => _OldMorseState();
}

class _OldMorseState extends State<OldMorse> {
  final player = AudioPlayer();
  bool statusPlay = false;

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
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
            },
          ),
          centerTitle: true,
          title: Text(judulMorse, style: const TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: warnaUngu,
        ),
        body:
        GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: huruf.length,
            itemBuilder: (BuildContext ctx, int i) {
              return InkWell(
                onTap: () async {
                  String hurufBesar = huruf[i].toUpperCase();
                  String hurufKecil = huruf[i].toLowerCase();
                  int indeks = i;
                  print(hurufKecil);
                  kePopup(hurufBesar, indeks);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  color: warnaUngu,
                  child:
                  Container(
                      child: Center(
                          child: Text(huruf[i],
                              style:TextStyle(
                                  color:warnaPutih,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTUlisanSuper))
                      )
                  ),
                ),
              );

            }
        ),

    );
  }
  void kePopup(hurufBesar, indeks){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content:
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 0.2 * MediaQuery.of(context).size.height,
                      width: 0.5 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: warnaPutih),
                        color: warnaUngu,
                      ),

                      child: Center(
                          child: Text(hurufBesar,
                              style:TextStyle(
                                  color:warnaPutih,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTUlisanSuper)
                          )
                      )
                  ),
                  Text(hurufMorse[indeks], style: TextStyle(
                      color:warnaHitam,
                      fontFamily: 'PoppinsMedium',
                      fontSize: ukFormTUlisanSuper)),
                  Text(mainSuara, style: TextStyle(
                      color:warnaHitam,
                      fontFamily: 'PoppinsMedium',
                      fontSize: ukFormTulisanKecil)),
                  const SizedBox(width: 10, height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () async {
                            await player.play(AssetSource('audio/morse/$indeks.wav'));
                          },
                          icon: Icon(Icons.play_arrow_rounded, size: ukFormTulisanBesar, color: warnaUngu),
                          label: Text(putarSuara, style: TextStyle(color: warnaUngu, fontSize: ukFormTulisanKecil)),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton.icon(
                          onPressed: () async {
                            player.stop();
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          icon: Icon(Icons.close, size: ukFormTulisanBesar, color: warnaUngu),
                          label: Text(stopSuara, style: TextStyle(color: warnaUngu, fontSize: ukFormTulisanKecil)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
