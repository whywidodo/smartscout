import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Layout/Game/DragDrop/DragDrop.dart';
import 'package:smartscout/Layout/Game/KuisUmum/Level1/KuisUmum1.dart';
import 'package:smartscout/Layout/Game/KuisUmum/Level2/Level2Soal1.dart';
import 'package:smartscout/Widget/WaveShape.dart';

import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';

class PilihanKuis extends StatefulWidget {
  const PilihanKuis({Key? key}) : super(key: key);

  @override
  _PilihanKuisState createState() => _PilihanKuisState();
}

class _PilihanKuisState extends State<PilihanKuis> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
                    (route) => false);
          },
        ),
        centerTitle: true,
        title: Text(
          pilihKuis,
          style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanSedang, color: warnaPutih),
        ),
        elevation: 0.0,
        // toolbarHeight: 100,
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
      ),
      body:
      ListView(
        scrollDirection: Axis.vertical,
        children: <Widget> [
          InkWell(
              onTap: () {
                keKuisLevel1();
              },
              child:
              Padding(
                padding:  const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Container(
                    decoration: BoxDecoration(
                      // color: warnaCyan500,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ warnaCyan700, warnaCyan500],
                        ),
                        border: Border.all(color: warnaAbu),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                menuKuis1,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                      ],
                    )
                ),
              )

          ),
          InkWell(
              onTap: () {
                cekKuis2();
              },
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      // color: warnaCyan500,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ warnaCyan700, warnaCyan500],
                        ),
                        border: Border.all(color: warnaAbu),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                menuKuis2,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            height: 50,
                            width: 0.3 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: (kuis2 == "null") ? Icon(Icons.lock_outline, size: ukSimbolKecil, color: warnaPutih) : null
                            )
                        )
                      ],
                    )
                ),
              )

          ),
          InkWell(
              onTap: () {
                cekKuis3();
              },
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      // color: warnaCyan500,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ warnaCyan700, warnaCyan500],
                        ),
                        border: Border.all(color: warnaAbu),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                menuKuis3,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            height: 50,
                            width: 0.3 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: (kuis3 == "null") ? Icon(Icons.lock_outline, size: ukSimbolKecil, color: warnaPutih) : null
                            )
                        )
                      ],
                    )
                ),
              )

          ),
          InkWell(
              onTap: () {
                cekKuis4();
              },
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      // color: warnaCyan500,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ warnaCyan700, warnaCyan500],
                        ),
                        border: Border.all(color: warnaAbu),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                menuKuis4,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            height: 50,
                            width: 0.3 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: (kuis4 == "null") ? Icon(Icons.lock_outline, size: ukSimbolKecil, color: warnaPutih) : null
                            )
                        )
                      ],
                    )
                ),
              )

          ),
          InkWell(
              onTap: () {
                cekKuis5();
              },
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                    decoration: BoxDecoration(
                      // color: warnaCyan500,
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [ warnaCyan700, warnaCyan500],
                        ),
                        border: Border.all(color: warnaAbu),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                menuKuis5,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                        ),
                        Container(
                            alignment: Alignment.centerRight,
                            height: 50,
                            width: 0.3 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: (kuis5 == "null") ? Icon(Icons.lock_outline, size: ukSimbolKecil, color: warnaPutih) : null
                            )
                        )
                      ],
                    )
                ),
              )

          ),
        ],
      ),
      bottomNavigationBar: getNavBar(context),
    );
  }

  void keKuisLevel1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const KuisUmum1()));
  }

  void keKuisLevel2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Level2Soal1()));
  }

  void keDragDrop() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DragDrop()));
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
            color: warnaUngu
        ),
      ),
    );
  }

  void cekKuis2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain2 = prefs.getBool("loloske2");
    if(isMain2 == true){
      keKuisLevel2();
    }else{
      kePopupAlert(2);
    }
  }


  void cekKuis3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain3 = prefs.getBool("loloske3");
    if(isMain3 == true){
      print("Bisa lanjut ke kuis 3");
    }else{
      kePopupAlert(3);
    }
  }

  void cekKuis4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain4 = prefs.getBool("loloske4");
    if(isMain4 == true){
      print("Bisa lanjut ke kuis 4");
    }else{
      kePopupAlert(4);
    }
  }

  void cekKuis5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain5 = prefs.getBool("loloske5");
    if(isMain5 == true){
      print("Bisa lanjut ke kuis 5");
    }else{
      kePopupAlert(5);
    }
  }

  void kePopupAlert(alertValue){
    if(alertValue == 2){
      alertMain = alertMain2;
    }else if(alertValue == 3){
      alertMain = alertMain3;
    }else if(alertValue == 4){
      alertMain = alertMain4;
    }else if(alertValue == 5){
      alertMain = alertMain5;
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Column(
              children: <Widget>[
                CircleAvatar(
                  maxRadius: ukSimbolSedang,
                  backgroundColor: warnaRed500,
                  child: Icon(Icons.warning, color: warnaPutih, size: ukSimbolSedang),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    alertJudul,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: warnaHitamAbu,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanKecil),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    alertMain,
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
}
