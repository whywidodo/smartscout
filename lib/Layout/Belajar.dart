import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Layout/MateriBP.dart';
import 'package:smartscout/Layout/MateriKK.dart';
import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import 'Homepage.dart';
import 'MateriSejarah.dart';

class Belajar extends StatefulWidget {
  const Belajar({Key? key}) : super(key: key);

  @override
  _BelajarState createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
          centerTitle: true,
          title: Text(
            judulPengetahuan,
            style: const TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: warnaUngu,
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
                  child:
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/bapaPandu.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulMateri,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          )
                      )
                    ],
                  )
              ),
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
                  child:
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pramukaInd.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Container(
                          width: 0.4 * MediaQuery.of(context).size.width,
                          child: Text(
                            judulSejarah,
                            style: TextStyle(
                                color: warnaUngu,
                                fontFamily: 'PoppinsMedium',
                                fontSize: ukFormTulisanSedang),
                          ),
                        )
                      )
                    ],
                  )
              ),
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
                  child:
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/kodeKeh.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulKode,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          )
                      )
                    ],
                  )
              ),
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
                  child:
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/gerPramuka.png',
                        height: 70,
                        fit: BoxFit.fitHeight,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Container(
                            width: 0.4 * MediaQuery.of(context).size.width,
                            child: Text(
                              judulLambang,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsMedium',
                                  fontSize: ukFormTulisanSedang),
                            ),
                          )
                      )
                    ],
                  )
              ),
            )
          ],
        ));
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
    print("Ke layout materi Lambang Pramuka");
  }
}
