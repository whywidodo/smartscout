import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataKode.dart';
import 'package:smartscout/Layout/Belajar.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/PengetahuanUmum/DownloadKK.dart';
import 'package:smartscout/Widget/WaveShape.dart';

class MateriKK extends StatefulWidget {
  const MateriKK({Key? key}) : super(key: key);

  @override
  _MateriKKState createState() => _MateriKKState();
}

class _MateriKKState extends State<MateriKK> {
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
        title: Text(judulKode, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
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
                  await player.play(AssetSource('audio/pengetahuan/kode.mp3'));
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
                        "Pengertian\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisan),
                      ),
                      Text(
                        pembuka + pembuka2 + satya + pembuka3 + darma,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Text(
                        macamKode,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisan),
                      ),
                      Text(
                        detail,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Text(
                        "Siaga\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisan),
                      ),
                      Text(
                        siaga + dwi + Dwisatya + dwidar + Dwidarma,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Text(
                        "Penggalang\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisan),
                      ),
                      Text(
                        penggalang + tri + Trisatya + dasa + Dasadarma,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Text(
                        "Penegak\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisan),
                      ),
                      Text(
                        penegak + tri + Trisatya1 + dasa + Dasadarma,
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
            builder: (context) => const DownloadKK(),
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
