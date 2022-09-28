import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';

import 'KritikSaran.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
                context, MaterialPageRoute(builder: (context) => Homepage()));
            selectedIndex = 0;
          },
        ),
        centerTitle: true,
        // title: Text(judulAbout, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
        backgroundColor: warnaUngu,
        foregroundColor: warnaPutih,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [ warnaUngu, warnaPurple700],
                ),
              ),
              padding: const EdgeInsets.only(top: 50),
              child: Column(children: [
                Image.asset('assets/images/icons/sscwhite.png', width: 100, height: 100),
                Text(dataNamaAplikasi, style: TextStyle(color: warnaPutih, fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanBesar)),
                Text(dataTaglineAplikasi, style: TextStyle(color: warnaPutih, fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
                Text(dataVersiAplikasi, style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil)),

              ])
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(about,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                ],
              ),
            ),
            elevation: 2,
            shadowColor: warnaHitam,
          ),
          Card(
            margin: EdgeInsets.all(10.0),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(masukan + pengembang,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
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
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => KritikSaran()));
      } else if (index == 2) {
        print("Ke about");
      } else if (index == 3) {
        print("Ke user");
      }
    });
  }
}
