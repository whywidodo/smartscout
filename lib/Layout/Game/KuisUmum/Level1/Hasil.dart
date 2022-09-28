import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Layout/Game/KuisUmum/Level1/KuisUmum1.dart';
import 'package:smartscout/Layout/Game/KuisUmum/Level2/Level2Soal1.dart';
import 'package:smartscout/Layout/Game/PilihanKuis.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';

class Hasil extends StatefulWidget {
  const Hasil({Key? key}) : super(key: key);

  @override
  _HasilState createState() => _HasilState();
}

class _HasilState extends State<Hasil> {
  @override
  void initState() {
    super.initState();
    if(hasilBenar > 7){
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
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: warnaUngu,
          automaticallyImplyLeading: false),
      body:
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
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
                            height: 0.6 * MediaQuery.of(context).size.height,
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
                                  percent: hasilJawabKuis / 100,
                                  progressColor: warnaUngu,
                                  animation: true,
                                  animationDuration: 1500,
                                  center: Text(
                                    hasilJawabKuis.toString(),
                                    style: TextStyle(
                                        color: warnaHitam,
                                        fontSize: ukFormTulisanBesar),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 20.0),
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
                                                          hasilBenar.toInt().toString(),
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
                                                          hasilSalah.toInt().toString(),
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
                                ),
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
                                hasilBenar = 0,
                                hasilSalah = 0,
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
                                if(hasilBenar > 7){
                                  lanjutKuis2()
                                }else{
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
                    )
                  ],
                ),
              )),
        ],
      )
    );
  }

  void keHomepage() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Homepage()),
        (route) => false);
  }
  void keMenuKuis() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PilihanKuis()));
  }

  void keUlangiKuis() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const KuisUmum1()));
  }
  void lanjutKuis2() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Level2Soal1()));
  }
}
