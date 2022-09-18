import 'package:flutter/material.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Layout/Game/MenuGame.dart';

import '../../Constant/Data.dart';
import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';
import 'KuisUmum2.dart';

class KuisUmum1 extends StatefulWidget {
  const KuisUmum1({Key? key}) : super(key: key);

  @override
  _KuisUmum1State createState() => _KuisUmum1State();
}

class _KuisUmum1State extends State<KuisUmum1> {
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
                    child: Text(nomorSoalKuis1, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                  ),
                  Card(
                    color: warnaPutih,
                    margin: const EdgeInsets.all(5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(soalKuis1, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              CustomRadio(jawabanKuis1a, 1),
              CustomRadio(jawabanKuis1b, 2),
              CustomRadio(jawabanKuis1c, 3),
              CustomRadio(jawabanKuis1d, 4),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: Text(nextSoal1),
        child: const Icon(Icons.navigate_next),
        backgroundColor: warnaUngu,
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => KuisUmum2()));
        },
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
                color: (valueSoal1 == index) ? warnaUngu  : warnaHitam,
                width: 0.5
            ),
            primary: (valueSoal1 == index) ? warnaUngu  : warnaHitam,
            textStyle: TextStyle(
                color: (valueSoal1 == index) ? warnaUngu  : warnaHitam,
                fontSize: ukFormTulisanSedang,
                fontStyle: FontStyle.normal
            ),
          ),
          onPressed: () {
            setState(() {
              valueSoal1 = index;
              if(valueSoal1 == 1){
                jawab1 = 10;
              }else{
                jawab1 = 0;
              }
            });
          },
        ),
      )
    );
  }
}
