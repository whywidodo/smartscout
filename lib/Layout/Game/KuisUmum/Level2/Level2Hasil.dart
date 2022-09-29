import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataSoal2.dart';
import 'package:smartscout/Layout/Game/PilihanKuis.dart';
import 'package:smartscout/Layout/Game/KuisUmum/Level2/Level2Soal1.dart';
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
  void initState() {
    super.initState();
    if(lv2_hasilBenar > 7){
      kuisUcapan = kuisSelamat;
      kuisAlert = kuisSukses;
      kuisBool = true;
    }else{
      kuisUcapan = kuisMaaf;
      kuisAlert = kuisGagal;
      kuisBool = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                          height: 0.5 * MediaQuery.of(context).size.height,
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
                                    const Divider(
                                      color: warnaAbu,
                                      thickness: 0.5,
                                    ),
                                    Text(kuisUcapan, textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: warnaHitamAbu,
                                            fontSize: ukFormTulisanPas,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                    Text(kuisAlert, textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: warnaHitamAbu,
                                          fontSize: ukFormTulisanSedang,
                                        )
                                    ),
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: warnaPutih,
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () => {
                              keMenuKuis(),
                              resetNilai_lv2(),
                              lv2_hasilBenar = 0,
                              lv2_hasilSalah = 0,
                            },
                            icon: Icon(Icons.home_outlined, color: warnaUngu,),
                            label: Text(
                                "Menu Kuis",
                                style: TextStyle(
                                    color: warnaUngu,
                                    fontFamily:
                                    'PoppinsMedium',
                                    fontSize: ukFormTulisanKecil)
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child:
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: warnaPutih,
                              shape:RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                            onPressed: () => {
                              if(lv2_hasilBenar > 7){
                                resetNilai_lv2(),
                                keSoon()
                              }else{
                                resetNilai_lv2(),
                                keUlangiKuis()
                              }
                            },

                            label: kuisBool ?
                            Text(
                                "Lanjut",
                                style: TextStyle(
                                    color: warnaUngu,
                                    fontFamily:
                                    'PoppinsMedium',
                                    fontSize: ukFormTulisanKecil)
                            ) :
                            Text(
                                "Ulangi",
                                style: TextStyle(
                                    color: warnaUngu,
                                    fontFamily:
                                    'PoppinsMedium',
                                    fontSize: ukFormTulisanKecil)
                            ),
                            icon: kuisBool ? Icon(Icons.next_plan_outlined, color: warnaUngu,) : Icon(Icons.repeat, color: warnaUngu,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void keHomepage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
        (route) => false);
  }

  void keMenuKuis() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PilihanKuis()));
  }

  void keUlangiKuis() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Level2Soal1()));
  }
  void keSoon(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Column(
              children: <Widget>[
                Icon(Icons.error_outline_outlined, color: warnaRed500, size: ukSimbolSedang),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    judulSoon,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: warnaHitamAbu,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanKecil),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      alertSoon,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: warnaHitamAbu,
                          fontFamily: 'PoppinsMedium',
                          fontSize: ukFormTulisanKecil),
                    )
                ),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: warnaUngu,
                        ),
                        child: Text("OK", style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil)),
                      ),
                    )
                )
              ],
            ),
          );
        });
  }

  void resetNilai_lv2(){
    lv2_valueSoal1 = 0;
    lv2_valueSoal2 = 0;
    lv2_valueSoal3 = 0;
    lv2_valueSoal4 = 0;
    lv2_valueSoal5 = 0;
    lv2_valueSoal6 = 0;
    lv2_valueSoal7 = 0;
    lv2_valueSoal8 = 0;
    lv2_valueSoal9 = 0;
    lv2_valueSoal10 = 0;
    lv2_jawab1 = 0;
    lv2_jawab2 = 0;
    lv2_jawab3 = 0;
    lv2_jawab4 = 0;
    lv2_jawab5 = 0;
    lv2_jawab6 = 0;
    lv2_jawab7 = 0;
    lv2_jawab8 = 0;
    lv2_jawab9 = 0;
    lv2_jawab10 = 0;
    lv2_hasilJawabKuis = 0;
  }

}
