import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartscout/Constant/DataSoal2.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';

import 'Level2Hasil.dart';
import 'Level2Soal9.dart';

class Level2Soal10 extends StatefulWidget {
  const Level2Soal10({Key? key}) : super(key: key);

  @override
  _Level2Soal10State createState() => _Level2Soal10State();
}

class _Level2Soal10State extends State<Level2Soal10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Level2Soal9()));
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
                  child: Text(lv2_nomorSoalKuis10, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                ),
                Card(
                  color: warnaPutih,
                  margin: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(lv2_soalKuis10, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              CustomRadio(lv2_jawabanKuis10a, 1),
              CustomRadio(lv2_jawabanKuis10b, 2),
              CustomRadio(lv2_jawabanKuis10c, 3),
              CustomRadio(lv2_jawabanKuis10d, 4),
            ],
          ),

        ],
      ),
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        children: <Widget> [
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: Text(lv2_prevSoal9),
                backgroundColor: warnaUngu,
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Level2Soal9()));
                },
                child: Icon(Icons.navigate_before),
              )
          ),
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: Text(lv2_nextFinishKU),
                backgroundColor: warnaGreen700,
                onPressed: (){
                  print(lv2_jawab10);
                  keHasil();
                },
                child: Icon(Icons.check),
              )
          )
        ],
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
                      Text(lv2_kluKuis10, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              primary: (lv2_valueSoal10 == index) ? warnaPutih  : warnaPurple700,
              backgroundColor: (lv2_valueSoal10 == index) ? warnaPurple700  : warnaPutih,
            ),
            onPressed: () {
              setState(() {
                lv2_valueSoal10 = index;
                if(lv2_valueSoal10 == 4){
                  lv2_jawab10 = 10;
                }else{
                  lv2_jawab10 = 0;
                }
              });
            },
            child: Text(text),
          ),
        )
    );
  }

  void keHasil(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Column(
              children: <Widget>[
                Text(
                  'Apakah kamu yakin ingin menyelesaikan kuis ini?',
                  style: TextStyle(
                      color: warnaHitam,
                      fontFamily: 'PoppinsMedium',
                      fontSize: ukFormTulisanKecil),
                ),
                const SizedBox(width: 10, height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(5),
                      child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: warnaUngu),
                              color: warnaPutih
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(warnaUngu),
                            ),
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Text('Tidak'),
                          )
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5),
                      child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: warnaUngu),
                              color: warnaUngu
                          ),
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(warnaPutih),
                            ),
                            onPressed: () async {
                              lv2_hasilJawabKuis = lv2_jawab1 + lv2_jawab2 + lv2_jawab3 + lv2_jawab4 + lv2_jawab5 + lv2_jawab6 + lv2_jawab7 + lv2_jawab8 + lv2_jawab9 + lv2_jawab10;
                              lv2_hasilBenar = lv2_hasilJawabKuis / 10;
                              lv2_hasilSalah = 10 - lv2_hasilBenar;
                              print(lv2_hasilJawabKuis);
                              if(lv2_hasilBenar > 8){
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.setBool("loloske3", true);
                                kuis3 = (await prefs.setString("lanjutKuis3", "loloske3")).toString();
                              }
                              Navigator.pop(context);
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => Level2Hasil()));
                            },
                            child: Text('Ya'),
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
