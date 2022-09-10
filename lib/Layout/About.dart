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
              padding: EdgeInsets.only(top: 80),
              child: Column(children: [
                Image.asset('assets/images/smartscout.png', width: 100, height: 100),
                Text(dataNamaAplikasi, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanBesar)),
                Text(dataTaglineAplikasi, style: TextStyle(color: Colors.white, fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
                Text(dataVersiAplikasi, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil))
              ])
          )
        ],
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

}
