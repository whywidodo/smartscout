import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataBP.dart';
import 'package:smartscout/Layout/Belajar.dart';
import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';

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
        title: Text(
          judulMateri,
          style: const TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: warnaUngu,
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
