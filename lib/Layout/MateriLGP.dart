import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import '../Constant/DataLGP.dart';
import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import '../Widget/WaveShape.dart';
import 'Belajar.dart';

class MateriLGP extends StatefulWidget {
  const MateriLGP({Key? key}) : super(key: key);

  @override
  _MateriLGPState createState() => _MateriLGPState();
}

class _MateriLGPState extends State<MateriLGP> {
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
                child: Text(judulLambang,
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
    );
  }
}
