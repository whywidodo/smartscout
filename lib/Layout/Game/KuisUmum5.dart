import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';

import '../../Constant/Data.dart';
import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';
import 'KuisUmum4.dart';
import 'KuisUmum6.dart';

class KuisUmum5 extends StatefulWidget {
  const KuisUmum5({Key? key}) : super(key: key);

  @override
  _KuisUmum5State createState() => _KuisUmum5State();
}

class _KuisUmum5State extends State<KuisUmum5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => KuisUmum4()));
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
                  child: Text(nomorSoalKuis5, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                ),
                Card(
                  color: warnaPutih,
                  margin: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(soalKuis5, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              CustomRadio(jawabanKuis5a, 1),
              CustomRadio(jawabanKuis5b, 2),
              CustomRadio(jawabanKuis5c, 3),
              CustomRadio(jawabanKuis5d, 4),
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
                heroTag: Text(prevSoal4),
                backgroundColor: warnaUngu,
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => KuisUmum4()));
                },
                child: Icon(Icons.navigate_before),
              )
          ),
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                heroTag: Text(nextSoal6),
                backgroundColor: warnaUngu,
                onPressed: (){
                  print(jawab5);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => KuisUmum6()));
                },
                child: Icon(Icons.navigate_next),
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
                      Text(kluKuis5, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
              primary: (valueSoal5 == index) ? warnaPutih  : warnaPurple700,
              backgroundColor: (valueSoal5 == index) ? warnaPurple700  : warnaPutih,
            ),
            onPressed: () {
              setState(() {
                valueSoal5 = index;
                if(valueSoal5 == 3){
                  jawab5 = 10;
                }else{
                  jawab5 = 0;
                }
              });
            },
            child: Text(text),
          ),
        )
    );
  }

}
