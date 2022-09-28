import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'About.dart';

class KritikSaran extends StatefulWidget {
  const KritikSaran({Key? key}) : super(key: key);

  @override
  _KritikSaranState createState() => _KritikSaranState();
}

class _KritikSaranState extends State<KritikSaran> {
  int _randomAngkaGenerator = 0;
  final TextEditingController _randomAngkaCek = TextEditingController();
  final TextEditingController _kritiksaran = TextEditingController();
  final CollectionReference _hasilkritiksaran = FirebaseFirestore.instance.collection('kritiksaran');

  Random random = Random();

  @override
  void initState() {
    super.initState();
    generateAngka();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(judulKritik, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
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
        foregroundColor: warnaPutih,
        elevation: 1.0,
      ),
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset(
                  'assets/images/kritiksaran.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.4
              ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget> [
                      const Expanded(
                        child: Divider(
                          color: warnaAbu,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child:
                        Container(
                            alignment: Alignment.centerLeft,
                            child:
                            Text(
                              textTulisan,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: warnaHitam,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: ukFormTulisanSedang),
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child:
                        Container(
                            alignment: Alignment.centerLeft,
                            child:
                            Text(
                              textKSaran,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: ukFormTulisanSedang),
                            )
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: warnaAbu,
                          thickness: 0.5,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextFormField(
                        controller: _kritiksaran,
                        minLines: 7,
                        maxLines: null,
                        decoration: const InputDecoration(
                            isDense: true,
                            hintText: 'Masukan kritik dan saran Anda',
                            contentPadding: EdgeInsets.all(14),
                            fillColor: warnaPutih,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: warnaUngu, width: 1.1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: warnaAbu),
                            )),
                        style: TextStyle(fontSize: ukFormTulisanKecil, color: warnaHitam)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: <Widget> [
                        Expanded(
                          child:
                          TextFormField(
                              controller: _randomAngkaCek,
                              decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'Kode verifikasi',
                                  contentPadding: EdgeInsets.all(14),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: warnaUngu, width: 1.1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: warnaAbu),
                                  )),
                              style: const TextStyle(
                                  fontSize: 12.0, color: warnaHitam)
                          ),
                        ),
                        Expanded(
                          child: Text(
                              '   $_randomAngkaGenerator',
                              style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanSedang)),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: Container(
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          backgroundColor: warnaUngu,
                          shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                        onPressed: () async {
                          if(_randomAngkaCek.text == _randomAngkaGenerator.toString()){
                            final String? kritik = _kritiksaran.text;
                            if(kritik != null){
                              await _hasilkritiksaran.add({"kritiksaran" : kritik});
                              Fluttertoast.showToast(
                                  msg: "Kritik dan saran berhasil terkirim.",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: warnaUngu,
                                  textColor: Colors.white,
                                  fontSize: ukFormTulisanSedang
                              );
                            }
                            _kritiksaran.text = "";
                            _randomAngkaCek.text = "";
                          }else{
                            Fluttertoast.showToast(
                                msg: "Kritik dan saran gagal terkirim.",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: warnaRed500,
                                textColor: Colors.white,
                                fontSize: ukFormTulisanSedang
                            );
                          }
                        },

                        label: Text("Kirim",
                            style: TextStyle(color: warnaPutih, fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanKecil)
                        ),
                        icon: Icon(Icons.send_outlined, color: warnaPutih),

                      ),
                    ),
                  )
                ],
              ),
            ),
            elevation: 2,
            shadowColor: warnaHitam,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: warnaUngu,
        index: selectedIndex,
        height: ukNavbar,
        color: warnaPutih,
        buttonBackgroundColor: warnaPutih,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.home, size: ukIconBesar, color: warnaUngu),
          Icon(Icons.chat_outlined, size: ukIconBesar, color: warnaUngu),
          Icon(Icons.info_outline, size: ukIconBesar, color: warnaUngu),
          Icon(Icons.account_circle_outlined, size: ukIconBesar, color: warnaUngu),
        ],
        onTap: (index) {
          _onItemTapped(index);
        },
        letIndexChange: (index) => true,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      } else if (index == 1) {
        print("Ke kritik");
      } else if (index == 2) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => About()));
      } else if (index == 3) {
        print("Ke user");
      }
    });
  }

  void generateAngka(){
    setState(() {
      var min = 1000;
      var max = 9999;
      _randomAngkaGenerator = min + random.nextInt(max - min);
    });
  }

}
