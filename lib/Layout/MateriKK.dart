import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataKode.dart';

import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import '../Widget/WaveShape.dart';
import 'Belajar.dart';

class MateriKK extends StatefulWidget {
  const MateriKK({Key? key}) : super(key: key);

  @override
  _MateriKKState createState() => _MateriKKState();
}

class _MateriKKState extends State<MateriKK> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Belajar()),
                (route) => false);
          },
        ),
        centerTitle: true,
        elevation: 0.0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipPath(
          clipper: WaveShape(),
          child: Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            color: warnaUngu,
            child: Center(
                child: Text(judulKode,
                    style: TextStyle(
                        fontSize: ukFormTulisanSedang,
                        color: Colors.white,
                        fontFamily: 'PoppinsMedium'))),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
    );
  }
}
