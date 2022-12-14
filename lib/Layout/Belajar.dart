import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Layout/PengetahuanUmum/MateriBP.dart';
import 'package:smartscout/Layout/PengetahuanUmum/MateriKK.dart';
import 'package:smartscout/Layout/PengetahuanUmum/MateriLGP.dart';
import 'package:smartscout/Layout/PengetahuanUmum/MateriSejarah.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'Homepage.dart';

class Belajar extends StatefulWidget {
  const Belajar({Key? key}) : super(key: key);

  @override
  _BelajarState createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
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
            judulPengetahuan,
            style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanSedang, color: warnaPutih),
          ),
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
        body: ListView(
          children: [
            Image.asset('assets/images/learning.png', height: 250),
            InkWell(
              onTap: () {
                keMateriBP();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: warnaPutih,
                      border: Border.all(color: warnaAbu),
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/bapaPandu.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulMateri,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          ))
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                keMateriSP();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: warnaPutih,
                      border: Border.all(color: warnaAbu),
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/pramukaInd.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulSejarah,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          ))
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                keMateriKK();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: warnaPutih,
                      border: Border.all(color: warnaAbu),
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/kodeKeh.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulKode,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          ))
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                keMateriLP();
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: warnaPutih,
                      border: Border.all(color: warnaAbu),
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/gerPramuka.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulLambang,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          ))
                    ],
                  )),
            ),

          ],
        )
    );
  }

  void keMateriBP() {
    // Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MateriBP()));
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const MateriBP()),
    //     (route) => false);
  }

  void keMateriSP() {
    // Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MateriSejarah()));
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => MateriSejarah()),
    //     (route) => false);
  }

  void keMateriKK() {
    // Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MateriKK()));
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => MateriKK()),
    //         (route) => false);
  }

  void keMateriLP() {
    // Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MateriLGP()));
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => MateriKK()),
    //         (route) => false);
  }
}
