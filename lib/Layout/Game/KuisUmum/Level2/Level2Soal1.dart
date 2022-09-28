import 'package:flutter/material.dart';
import 'package:smartscout/Constant/DataSoal2.dart';
import 'package:smartscout/Layout/Game/PilihanKuis.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';

import 'Level2Soal2.dart';

class Level2Soal1 extends StatefulWidget {
  const Level2Soal1({Key? key}) : super(key: key);

  @override
  _Level2Soal1State createState() => _Level2Soal1State();
}

class _Level2Soal1State extends State<Level2Soal1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const PilihanKuis()));
            selectedIndex = 0;
          },
        ),
        centerTitle: true,
        backgroundColor: warnaUngu,
        foregroundColor: warnaPutih,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(0.0),
                    bottomLeft: Radius.circular(0.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ warnaUngu, warnaPurple700],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:
              Column(
                children: [
                  Center(
                    child: Text(lv2_nomorSoalKuis1, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                  ),
                  Card(
                    color: warnaPutih,
                    margin: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(lv2_soalKuis1, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                        ],
                      ),
                    ),
                    elevation: 2,
                    shadowColor: warnaHitam,
                  )
                ],
              ),
          ),
          areaKlu(),
          Column(
            children: <Widget> [
              CustomRadio(lv2_jawabanKuis1a, 1),
              CustomRadio(lv2_jawabanKuis1b, 2),
              CustomRadio(lv2_jawabanKuis1c, 3),
              CustomRadio(lv2_jawabanKuis1d, 4),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: Text(lv2_nextSoal1),
        child: const Icon(Icons.navigate_next),
        backgroundColor: warnaUngu,
        onPressed: (){
          print(lv2_jawab1);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Level2Soal2()));
        },
      ),
    );
  }

  Widget areaKlu(){
    if(lv2_kluKuis1 != "-"){
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(lv2_kluKuis1, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                  ],
                ),
              ),
              elevation: 2,
              shadowColor: warnaHitam,
            ),
            const SizedBox(height: 10),

          ],
        )
      );
    }else{
      return const SizedBox(height: 10);
    }
  }

  Widget CustomRadio(String text, int index){
    return Container(
        height: 0.07 * MediaQuery.of(context).size.height,
        width: 0.8 * MediaQuery.of(context).size.width,
        child:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child:
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: warnaPurple700,
                      width: 1.0,
                      style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20)
              ),
              primary: (lv2_valueSoal1 == index) ? warnaPutih  : warnaPurple700,
              backgroundColor: (lv2_valueSoal1 == index) ? warnaPurple700  : warnaPutih,
            ),
            onPressed: () {
              setState(() {
                lv2_valueSoal1 = index;
                if(lv2_valueSoal1 == 2){
                  lv2_jawab1 = 10;
                }else{
                  lv2_jawab1 = 0;
                }
              });
            },
            child: Text(text),
          ),
        )
    );
  }

}
