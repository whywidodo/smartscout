import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';

class Morse extends StatefulWidget {
  const Morse({Key? key}) : super(key: key);

  @override
  _MorseState createState() => _MorseState();
}

class _MorseState extends State<Morse> {
  final player = AudioPlayer();
  bool statusPlay = false;

  @override
  void initState(){
    super.initState();
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
        backgroundColor: warnaPutih,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
                    (route) => false);
          },
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              color: warnaUngu,
              child: Image.asset(
                  'assets/images/bgMorse.png',
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.fitWidth
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: huruf.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: warnaPutih,
                            border: Border.all(color: warnaAbu),
                            borderRadius: BorderRadius.circular(15)),
                        margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1, color: warnaPutih),
                                      color: warnaUngu,
                                    ),

                                    child: Center(
                                        child: Text(huruf[index],
                                            style:TextStyle(
                                                color:warnaPutih,
                                                fontFamily: 'PoppinsMedium',
                                                fontSize: ukFormTulisanBesar))
                                    )
                                ),
                                Text(hurufMorse[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      letterSpacing: 3.0,
                                      color: warnaHitam,
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: ukFormTulisanBesar),
                                ),
                                Container(
                                    child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(Icons.volume_up, color: warnaUngu, size: ukIconBesar),
                                              onPressed: () {
                                                String hurufBesar = huruf[index].toUpperCase();
                                                String hurufKecil = huruf[index].toLowerCase();
                                                int indeks = index;
                                                debugPrint(hurufKecil);
                                                kePopup(hurufBesar, indeks);
                                              }),

                                        ]))
                              ]),
                        )
                    );
                  }
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      )
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
