import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:share_plus/share_plus.dart';

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
        automaticallyImplyLeading: false,
        centerTitle: true,
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
            margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(about,
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil)),
                  const SizedBox(height: 15.0),
                  Text(pengembang,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: warnaHitam, fontWeight: FontWeight.bold, fontSize: ukFormTulisanKecil)),
                ],
              ),
            ),
            elevation: 2,
            shadowColor: warnaHitam,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.share_outlined),
        backgroundColor: warnaPurple500,
        onPressed: (){
          _onShare(context);
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: warnaUngu,
        index: selectedIndex,
        height: ukNavbar,
        color: warnaPutih,
        buttonBackgroundColor: warnaPutih,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: <Widget>[
          Icon(Icons.home, size: ukIconBesar, color: warnaUngu),
          Icon(Icons.chat_outlined, size: ukIconBesar, color: warnaUngu),
          Icon(Icons.info_outline, size: ukIconBesar, color: warnaUngu),
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
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Homepage()));
      } else if (index == 1) {
        Navigator.of(context, rootNavigator: true).pop();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const KritikSaran()));
      } else if (index == 2) {
        print("ke about");
      }
    });
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        textSharing,
        subject: sub,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
