import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
                    (route) => false);
            selectedIndex = 0;
          },
        ),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30)
        //   )
        // ),
        centerTitle: true,
        title: Text(judulAbout, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
        backgroundColor: warnaUngu,
        foregroundColor: warnaPutih,
      ),
      body: ListView(
        children: [
          Container(
              height: 300,
              color: warnaUngu,
              padding: const EdgeInsets.only(top: 50),
              child: Column(children: [
                Image.asset('assets/images/smartscout.png', width: 100, height: 100),
                Text(dataNamaAplikasi, style: TextStyle(color: warnaPutih, fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanBesar)),
                Text(dataTaglineAplikasi, style: TextStyle(color: warnaPutih, fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
                Text(dataVersiAplikasi, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil)),

              ])
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
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: warnaUngu,
        onPressed: (){
          print("Tombol floating ditekan");
          kePopupKritik();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: warnaUngu,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined), label: "Ranking"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "Tentang"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: "Profil"),
        ],
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
                (route) => false);
      } else if (index == 1) {
        print("Ke ranking");
      } else if (index == 2) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const About()),
                (route) => false);
      } else if (index == 3) {
        print("Ke user");
      }
    });
  }

  void kePopupKritik(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Column(
                children: <Widget>[
                  Text(
                    'Tulis Kritik dan Saran Anda',
                    style: TextStyle(
                        color: warnaHitam,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang),
                  ),
                  TextFormField(
                      minLines: 3,
                      maxLines: null,
                      decoration: const InputDecoration(
                          isDense: true,
                          hintText: 'Masukan kritik dan saran Anda',
                          contentPadding: EdgeInsets.all(14),
                          fillColor: warnaPutih,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: warnaUngu, width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: warnaUngu),
                          )),
                      style: TextStyle(fontSize: ukFormTulisanKecil, color: warnaHitam)
                  ),
                  const SizedBox(width: 10, height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    color: warnaUngu,
                    child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(Icons.send, size: ukIconBesar, color: warnaPutih)),
                  ),
                ],
              ),
          );
        });
  }

}
