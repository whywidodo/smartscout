import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartscout/Layout/About.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Layout/Belajar.dart';
import 'package:smartscout/Layout/Game/PilihanKuis.dart';
import 'package:smartscout/Layout/KritikSaran.dart';
import 'package:smartscout/Layout/Morse.dart';
import 'package:smartscout/Layout/Semaphore.dart';
import 'package:smartscout/Layout/Game/DragDrop/DragDrop.dart';
import 'package:smartscout/Constant/DataSoalKuis.dart';
import 'package:smartscout/Constant/DataSoal2.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    aksesKuis2();
    aksesKuis3();
    aksesKuis4();
    aksesKuis5();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: warnaPutih,
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width,
                  color: warnaHomepage,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                    Container(
                        alignment: Alignment.centerLeft,
                        child:
                        Row(
                          children: [
                            Text(
                              textHai1,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: warnaHitam,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: ukFormTulisanPas),
                            ),
                            Text(
                              textHai2,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: warnaUngu,
                                  fontFamily: 'PoppinsSemiBold',
                                  fontSize: ukFormTulisanPas),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  width: MediaQuery.of(context).size.width,
                  color: warnaUngu,
                  child: Image.asset(
                      'assets/images/newBg.png',
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.fitWidth
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: <Widget> [
                    const Expanded(
                        child: Divider(
                          color: warnaAbu,
                          thickness: 0.5,
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child:
                      Container(
                          alignment: Alignment.centerLeft,
                          child:
                          Text(
                            textKMenu,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: warnaHitam,
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
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _keSemaphore();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/2,
                            decoration: BoxDecoration(
                                color: warnaPurple200,
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft,
                                  colors: [warnaPurple500, warnaPurple200],
                                ),
                                borderRadius: BorderRadius.only(topRight:Radius.circular(ukRounded), bottomLeft: Radius.circular(ukRounded))
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 0.2 * MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Icon(Icons.flag, size: ukSimbol, color: warnaPutih,),
                                  ),
                                ),
                                RichText(text: TextSpan(
                                    text: judulSemaphore,
                                    style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil),
                                    recognizer: TapGestureRecognizer()..onTap = () => _keSemaphore())
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),

                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _keMorse();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/2,
                            decoration: BoxDecoration(
                                color: warnaCyan200,
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [warnaCyan500, warnaCyan200],
                                ),
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(ukRounded), bottomRight: Radius.circular(ukRounded))
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 0.2 * MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Icon(Icons.wysiwyg_outlined, size: ukSimbol, color: warnaPutih,),
                                  ),
                                ),
                                RichText(text: TextSpan(
                                    text: judulMorse,
                                    style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil),
                                    recognizer: TapGestureRecognizer()..onTap = () => _keMorse())
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: (){
                            _kePengetahuanDasar();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/2,
                            decoration: BoxDecoration(
                                color: warnaOrange200,
                                gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [warnaOrange500, warnaOrange200],
                                ),
                                borderRadius: BorderRadius.only(topLeft:Radius.circular(ukRounded), bottomRight: Radius.circular(ukRounded))
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 0.2 * MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Icon(Icons.book, size: ukSimbol, color: warnaPutih,),
                                  ),
                                ),
                                RichText(text: TextSpan(
                                    text: judulPengetahuan,
                                    style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil),
                                    recognizer: TapGestureRecognizer()..onTap = () => _keSemaphore())
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),

                      Expanded(
                        child: InkWell(
                          onTap: (){
                            // _keGame();
                            _kePopupGame();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/2,
                            decoration: BoxDecoration(
                                color: warnaGreen200,
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [warnaGreen500, warnaGreen200],
                                ),
                                borderRadius: BorderRadius.only(topRight:Radius.circular(ukRounded), bottomLeft: Radius.circular(ukRounded))
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 0.2 * MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Icon(Icons.videogame_asset, size: ukSimbol, color: warnaPutih,),
                                  ),
                                ),
                                RichText(text: TextSpan(
                                    text: judulGame,
                                    style: TextStyle(color: warnaPutih, fontSize: ukFormTulisanKecil),
                                    recognizer: TapGestureRecognizer()..onTap = () => _keMorse())
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          const SizedBox(height: 10),
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

  void _keSemaphore(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Semaphore()));
  }

  void _keMorse(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Morse()));
  }

  void _kePengetahuanDasar(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => Belajar()));
  }

  void _kePopupGame(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: warnaPutih,
            scrollable: true,
            content: Column(
              children: <Widget>[
                Text(gameMenu,
                    style: TextStyle(
                        color: warnaOrange700,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang)),
                const Divider(
                  color: warnaAbu,
                  thickness: 0.5,
                ),
                const SizedBox(height: 15),
                AnimatedButton(
                  onPress: () {
                    Future.delayed(const Duration(milliseconds: 200), (){
                      resetNilai();
                      kePilihanKuis();
                    });
                  },
                  height: 50,
                  width: double.infinity,
                  text: gameKuis,
                  borderRadius: 80,
                  gradient: const LinearGradient(colors: [warnaRed500, warnaOrange500]),
                  selectedGradientColor: const LinearGradient(colors: [warnaUngu, warnaPurple500]),
                  isReverse: true,
                  selectedTextColor: warnaPutih,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  textStyle: TextStyle(
                      color: warnaPutih,
                      fontFamily: 'PoppinsMedium',
                      fontSize: ukFormTulisanSedang),
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
                const SizedBox(height: 10),
                AnimatedButton(
                  onPress: () {
                    Future.delayed(const Duration(milliseconds: 200), (){
                      keDragDrop();
                    });
                  },
                  height: 50,
                  width: double.infinity,
                  text: gameDragDrop,
                  borderRadius: 80,
                  gradient: LinearGradient(colors: [warnaRed500, warnaOrange500]),
                  selectedGradientColor: LinearGradient(colors: [warnaUngu, warnaPurple500]),
                  isReverse: true,
                  selectedTextColor: warnaPutih,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  textStyle: TextStyle(
                      color: warnaPutih,
                      fontFamily: 'PoppinsMedium',
                      fontSize: ukFormTulisanSedang),
                  borderColor: Colors.white,
                  borderWidth: 1,
                ),
              ],
            ),
          );
        });
  }

  void kePilihanKuis() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PilihanKuis()));
  }

  void keDragDrop() {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const DragDrop()));
  }

  void aksesKuis2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain2 = prefs.getBool("loloske2");
    if(isMain2 == true){
      kuis2 = "lolos";
    }
  }

  void aksesKuis3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain3 = prefs.getBool("loloske3");
    if(isMain3 == true){
      kuis3 = "lolos";
    }
  }

  void aksesKuis4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain4 = prefs.getBool("loloske4");
    if(isMain4 == true){
      kuis4 = "lolos";
    }
  }

  void aksesKuis5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isMain5 = prefs.getBool("loloske5");
    if(isMain5 == true){
      kuis5 = "lolos";
    }
  }

  void resetNilai(){
    valueSoal1 = 0;
    valueSoal2 = 0;
    valueSoal3 = 0;
    valueSoal4 = 0;
    valueSoal5 = 0;
    valueSoal6 = 0;
    valueSoal7 = 0;
    valueSoal8 = 0;
    valueSoal9 = 0;
    valueSoal10 = 0;
    jawab1 = 0;
    jawab2 = 0;
    jawab3 = 0;
    jawab4 = 0;
    jawab5 = 0;
    jawab6 = 0;
    jawab7 = 0;
    jawab8 = 0;
    jawab9 = 0;
    jawab10 = 0;
    hasilJawabKuis = 0;
  }

  void resetNilaiLevel2(){
    lv2_valueSoal1 = 0;
    lv2_valueSoal2 = 0;
    lv2_valueSoal3 = 0;
    lv2_valueSoal4 = 0;
    lv2_valueSoal5 = 0;
    lv2_valueSoal6 = 0;
    lv2_valueSoal7 = 0;
    lv2_valueSoal8 = 0;
    lv2_valueSoal9 = 0;
    lv2_valueSoal10 = 0;
    lv2_jawab1 = 0;
    lv2_jawab2 = 0;
    lv2_jawab3 = 0;
    lv2_jawab4 = 0;
    lv2_jawab5 = 0;
    lv2_jawab6 = 0;
    lv2_jawab7 = 0;
    lv2_jawab8 = 0;
    lv2_jawab9 = 0;
    lv2_jawab10 = 0;
    lv2_hasilJawabKuis = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        print("Ke homepage");
      } else if (index == 1) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => KritikSaran()));
      } else if (index == 2) {
        Navigator.pop(context);
        Navigator.push(context,MaterialPageRoute(builder: (context) => const About()));
      } else if (index == 3) {
        print("Ke user");
      }
    });
  }
}
