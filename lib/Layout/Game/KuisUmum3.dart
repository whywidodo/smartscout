import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Layout/Game/MenuGame.dart';

import '../../Constant/Data.dart';
import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';
import 'KuisUmum2.dart';

class KuisUmum3 extends StatefulWidget {
  const KuisUmum3({Key? key}) : super(key: key);

  @override
  _KuisUmum3State createState() => _KuisUmum3State();
}

class _KuisUmum3State extends State<KuisUmum3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuGame()));
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
                  child: Text(nomorSoalKuis3, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                ),
                Card(
                  color: warnaPutih,
                  margin: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(soalKuis3, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              CustomRadio(jawabanKuis3a, 1),
              CustomRadio(jawabanKuis3b, 2),
              CustomRadio(jawabanKuis3c, 3),
              CustomRadio(jawabanKuis3d, 4),
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
                heroTag: Text(prevSoal2),
                backgroundColor: warnaAbu,
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => KuisUmum2()));
                },
                child: Icon(Icons.navigate_before),
              )
          ),
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: Text(nextSoal3),
                backgroundColor: warnaUngu,
                onPressed: (){
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
    if(kluKuis1 != "-"){
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
                      Text(kluKuis1, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
          OutlinedButton(
            child: Text(text),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              side: BorderSide(
                  color: (valueSoal3 == index) ? warnaUngu  : warnaHitam,
                  width: 0.5
              ),
              primary: (valueSoal3 == index) ? warnaUngu  : warnaHitam,
              textStyle: TextStyle(
                  color: (valueSoal3 == index) ? warnaUngu  : warnaHitam,
                  fontSize: ukFormTulisanSedang,
                  fontStyle: FontStyle.normal
              ),
            ),
            onPressed: () {
              setState(() {
                valueSoal3 = index;
                if(valueSoal3 == 2){
                  jawab3 = 10;
                }else{
                  jawab3 = 0;
                }
              });
            },
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
                          color: warnaUngu,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(warnaPutih),
                            ),
                            onPressed: () { },
                            child: Text('Tidak'),
                          )
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5),
                      child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          color: warnaUngu,
                          child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(warnaPutih),
                            ),
                            onPressed: () { },
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
