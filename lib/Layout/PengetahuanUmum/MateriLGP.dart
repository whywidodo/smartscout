import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataLGP.dart';
import 'package:smartscout/Layout/Belajar.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/PengetahuanUmum/DownloadLGP.dart';
import 'package:smartscout/Widget/WaveShape.dart';

class MateriLGP extends StatefulWidget {
  const MateriLGP({Key? key}) : super(key: key);

  @override
  _MateriLGPState createState() => _MateriLGPState();
}

class _MateriLGPState extends State<MateriLGP> {
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
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Belajar()));
          },
        ),
        centerTitle: true,
        elevation: 1.0,
        title: Text(judulLambang, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ warnaUngu, warnaPurple700, warnaPurple500],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              icon: statusPlay? const Icon(Icons.stop) : const Icon(Icons.volume_up),
              onPressed: () async {
                if(statusPlay == false){
                  setState(() {
                    statusPlay = !statusPlay;
                  });
                  await player.play(AssetSource('audio/pengetahuan/lambang.mp3'));
                }else{
                  setState(() {
                    statusPlay = !statusPlay;
                  });
                  player.stop();
                }

              },
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    children: [
                      Text(
                        motto,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/pencipta.jpg', height: 200),
                      Text(
                        pencipta,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/tunasKelapa.png'),
                      Text(
                        uud + lampiran + makna1 + makna2 + makna3 + makna4 + makna5 + makna6,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                    ],
                  ))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.cloud_download_rounded),
        backgroundColor: warnaPurple500,
        onPressed: (){
          showDialog(
            context: context,
            builder: (context) => const DownloadLGP(),
          );
        },
      ),
      bottomNavigationBar: getNavBar(context),
    );
  }
  BottomAppBar getNavBar(context){
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: ClipPath(
        clipper: WaveShape(reverse: true, flip: true),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ warnaUngu, warnaPurple700, warnaPurple500],
            ),
          ),
        ),
      ),
    );
  }
}
