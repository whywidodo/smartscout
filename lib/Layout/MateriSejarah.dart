import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataSejarah.dart';

import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import '../Widget/WaveShape.dart';
import 'Belajar.dart';

class MateriSejarah extends StatefulWidget {
  const MateriSejarah({Key? key}) : super(key: key);

  @override
  _MateriSejarahState createState() => _MateriSejarahState();
}

class _MateriSejarahState extends State<MateriSejarah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Belajar()));
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
                child: Text(judulSejarah,
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
                        sejarah + sejarah1,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/gerakan.jpg'),
                      Text(
                        sejarah2,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: warnaHitam,
                            fontFamily: 'PoppinsMedium',
                            fontSize: ukIsiTulisanKecil),
                      ),
                      Image.asset('assets/images/Sejarah.jpg'),
                      Text(
                        sejarah3,
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
