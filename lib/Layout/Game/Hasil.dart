import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Layout/Homepage.dart';

import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';

class Hasil extends StatefulWidget {
  const Hasil({Key? key}) : super(key: key);

  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: warnaUngu,
        automaticallyImplyLeading: false
      ),
      body:
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ warnaUngu, warnaPurple700],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 0.5 * MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Text(hasilJawabKuis.toString(), style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                          ],
                        ),
                      )
                  ),
                  elevation: 4,
                  shadowColor: warnaHitam,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    keHomepage();
                  },
                  child: Container(
                      height: 50,
                      width: 0.5 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 2, color: warnaPutih),
                          color: warnaPurple700
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home, color: warnaPutih),
                          const SizedBox(width: 10),
                          Text("Beranda",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                letterSpacing: 2.0,
                                color: warnaPutih,
                                fontFamily: 'PoppinsMedium',
                                fontSize: ukFormTulisanKecil),
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          )
      ),
    );
  }

  void keHomepage(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
            (route) => false);
  }
}
