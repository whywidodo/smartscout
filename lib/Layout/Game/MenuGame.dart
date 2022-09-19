import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Layout/Game/KuisUmum1.dart';
import 'package:smartscout/Widget/WaveShape.dart';

import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';
import '../Homepage.dart';

class MenuGame extends StatefulWidget {
  const MenuGame({Key? key}) : super(key: key);

  @override
  _MenuGameState createState() => _MenuGameState();
}

class _MenuGameState extends State<MenuGame> {
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
            gameMenu,
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
            // child: Center(
            //     child: Text(gameMenu,
            //         style: TextStyle(
            //             fontSize: ukFormTulisanSedang,
            //             color: Colors.white,
            //             fontFamily: 'PoppinsMedium'))),
          ),
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                valueSoal1 = 0;
                valueSoal2 = 0;
                valueSoal3 = 0;
                valueSoal4 = 0;
                valueSoal5 = 0;
                valueSoal6 = 0;
                valueSoal7 = 0;
                valueSoal8 = 0;
                valueSoal9 = 0;
                valueSoal10 = 0;
                keKuisUmum();
              },
              child:
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [ warnaGreen700, warnaGreen500],
                          ),
                          border: Border.all(color: warnaAbu),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 100,
                            width: 0.5 * MediaQuery.of(context).size.width,
                            child:
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                              child: Text(
                                gameKuis,
                                style: TextStyle(
                                    color: warnaPutih,
                                    fontFamily: 'PoppinsMedium',
                                    fontSize: ukFormTulisanSedang),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ),
                          Container(
                              height: 100,
                              width: 0.3 * MediaQuery.of(context).size.width,
                              child:
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: Icon(Icons.event_note, size: ukSimbol, color: warnaPutih,),
                              )
                          )
                        ],
                      )
                  ),
                )

            ),
            InkWell(
                onTap: () {
                  print("keDragDrop");
                },
                child:
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                      decoration: BoxDecoration(
                          // color: warnaIndigo500,
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [ warnaIndigo700, warnaIndigo500],
                          ),
                          border: Border.all(color: warnaAbu),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.centerLeft,
                              height: 100,
                              width: 0.5 * MediaQuery.of(context).size.width,
                              child:
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                child: Text(
                                  gameDragDrop,
                                  style: TextStyle(
                                      color: warnaPutih,
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: ukFormTulisanSedang),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                          Container(
                              height: 100,
                              width: 0.3 * MediaQuery.of(context).size.width,
                              child:
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: Icon(Icons.picture_in_picture, size: ukSimbol, color: warnaPutih,),
                              )
                          )
                        ],
                      )
                  ),
                )

            ),
            InkWell(
                onTap: () {
                  print("keTebakGambar");
                },
                child:
                Padding(
                  padding: EdgeInsets.all(15),
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
                              height: 100,
                              width: 0.5 * MediaQuery.of(context).size.width,
                              child:
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                child: Text(
                                  gameTebak,
                                  style: TextStyle(
                                      color: warnaPutih,
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: ukFormTulisanSedang),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),
                          Container(
                              height: 100,
                              width: 0.3 * MediaQuery.of(context).size.width,
                              child:
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                child: Icon(Icons.voicemail, size: ukSimbol, color: warnaPutih,),
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
  void keKuisUmum() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => KuisUmum1()));
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

}
