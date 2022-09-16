import 'package:flutter/material.dart';
import 'package:smartscout/Layout/Game/MenuGame.dart';

import '../../Constant/Data.dart';
import '../../Constant/Ukuran.dart';
import '../../Constant/Warna.dart';

class Soal1 extends StatefulWidget {
  const Soal1({Key? key}) : super(key: key);

  @override
  _Soal1State createState() => _Soal1State();
}

class _Soal1State extends State<Soal1> {
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
              color: warnaUngu,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:
              Column(
                children: [
                  Center(
                    child: Text("Soal 1", style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanSedang, fontWeight: FontWeight.bold)),
                  ),
                  Card(
                    color: warnaPutih,
                    margin: EdgeInsets.all(5.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(lorem, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                        ],
                      ),
                    ),
                    elevation: 2,
                    shadowColor: warnaHitam,
                  )
                ],
              ),
          ),
          Card(
            margin: EdgeInsets.all(5.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(lorem, style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                ],
              ),
            ),
            elevation: 2,
            shadowColor: warnaHitam,
          ),
          const SizedBox(height: 10),
          Column(
            children: <Widget> [
              CustomRadio("14 Agustus", 1),
              CustomRadio("14 September", 2),
              CustomRadio("14 Oktober", 3),
              CustomRadio("14 November", 4),
            ],
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        backgroundColor: warnaUngu,
        onPressed: (){
          // print("Berikutnya");
          print(valueSoal1);
        },
      ),
    );
  }

  Widget CustomRadio(String text, int index){
    return Container(
      height: 0.05 * MediaQuery.of(context).size.height,
      width: 0.8 * MediaQuery.of(context).size.width,
      child:
      Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        child: OutlinedButton(
          child: Text(text),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 8.0),
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
            });
          },
        ),
      )
    );
  }
}
