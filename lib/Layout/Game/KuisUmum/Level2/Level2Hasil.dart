import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartscout/Constant/DataSoal2.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';

class Level2Hasil extends StatefulWidget {
  const Level2Hasil({Key? key}) : super(key: key);

  @override
  _Level2HasilState createState() => _Level2HasilState();
}

class _Level2HasilState extends State<Level2Hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: warnaUngu,
          automaticallyImplyLeading: false),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [warnaUngu, warnaPurple700],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: 30, bottom: 10, left: 10, right: 10),
                      child: Container(
                        width: 0.8 * MediaQuery.of(context).size.width,
                        height: 0.4 * MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Text("Hasil Test\n",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: warnaHitam,
                                  fontSize: ukFormTulisanKecil,
                                )),
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 12.0,
                              backgroundColor: Colors.grey,
                              percent: lv2_hasilJawabKuis / 100,
                              progressColor: warnaUngu,
                              animation: true,
                              animationDuration: 1500,
                              center: Text(
                                lv2_hasilJawabKuis.toString(),
                                style: TextStyle(
                                    color: warnaHitam,
                                    fontSize: ukFormTulisanBesar),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 30.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Analisis Kuis",
                                    style: TextStyle(
                                        color: warnaHitam,
                                        fontSize: ukFormTulisanKecil),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: warnaPutih),
                                                color: Colors.green,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                      lv2_hasilBenar.toInt().toString(),
                                                      style: TextStyle(
                                                          color: warnaPutih,
                                                          fontFamily:
                                                              'PoppinsMedium',
                                                          fontSize:
                                                              ukFormTulisanKecil)))),
                                        ),
                                        Expanded(
                                          child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: 1,
                                                    color: warnaPutih),
                                                color: Colors.red,
                                              ),
                                              child: Center(
                                                  child: Text(
                                                      lv2_hasilSalah.toInt().toString(),
                                                      style: TextStyle(
                                                          color: warnaPutih,
                                                          fontFamily:
                                                              'PoppinsMedium',
                                                          fontSize:
                                                              ukFormTulisanKecil)))),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child:
                                          Center(
                                      child: Text("Benar",
                                          style: TextStyle(
                                              fontSize: ukIsiTulisanKecil))),
                                  ),
                                      Expanded(
                                        child:
                                        Center(
                                            child: Text("Salah",
                                                style: TextStyle(
                                                    fontSize: ukIsiTulisanKecil))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                  elevation: 4,
                  shadowColor: warnaHitam,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    keHomepage();
                    lv2_hasilBenar = 0;
                    lv2_hasilSalah = 0;
                  },
                  child: Container(
                      height: 50,
                      width: 0.5 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 2, color: warnaPutih),
                          color: warnaPurple700),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home, color: warnaPutih),
                          const SizedBox(width: 10),
                          Text(
                            "Beranda",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                letterSpacing: 2.0,
                                color: warnaPutih,
                                fontFamily: 'PoppinsMedium',
                                fontSize: ukFormTulisanKecil),
                          ),
                        ],
                      )),
                )
              ],
            ),
          )),
    );
  }

  void keHomepage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
        (route) => false);
  }
}
