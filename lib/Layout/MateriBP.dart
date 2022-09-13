import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataBP.dart';
import 'package:smartscout/Layout/Belajar.dart';
import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import '../Widget/WaveShape.dart';

class MateriBP extends StatefulWidget {
  const MateriBP({Key? key}) : super(key: key);

  @override
  _MateriBPState createState() => _MateriBPState();
}

class _MateriBPState extends State<MateriBP> {
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
                child:
                Text(judulMateri,
                  style: TextStyle(
                      fontSize: ukFormTulisanSedang,
                      color: Colors.white,
                      fontFamily: 'PoppinsMedium')
                )
            ),
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
                        pendahuluan + biodata,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/bp.jpg'),
                      Text(
                        paragraf,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/perang.jpg'),
                      Text(
                        paragraf2,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/keluarga.jpg'),
                      Text(
                        paragraf3,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/penyambutan.jpg'),
                      Text(
                        paragraf4,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/batuNisan.jpg'),
                      Text(
                        biografi11,
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
