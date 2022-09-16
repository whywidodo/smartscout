import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Layout/About.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Layout/Belajar.dart';
import 'package:smartscout/Layout/Game/MenuGame.dart';
import 'package:smartscout/Layout/Morse.dart';
import 'package:smartscout/Layout/Semaphore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
              children: [
                Padding(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Image.asset('assets/images/bgHomePage.png'),
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
                            _keGame();
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
          Icon(Icons.bar_chart_outlined, size: ukIconBesar, color: warnaUngu),
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
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const Semaphore()),
    //         (route) => false);
    Navigator.push(context,MaterialPageRoute(builder: (context) => Semaphore()));
  }

  void _keMorse(){
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const Morse()),
    //         (route) => false);
    Navigator.push(context,MaterialPageRoute(builder: (context) => Morse()));
  }

  void _kePengetahuanDasar(){
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const Belajar()),
    //         (route) => false);
    Navigator.push(context,MaterialPageRoute(builder: (context) => Belajar()));
  }

  void _keGame(){
    // print("Ini akan mengalihkan ke Game");
    Navigator.push(context,MaterialPageRoute(builder: (context) => MenuGame()));
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        print("Ke homepage");
      } else if (index == 1) {
        print("Ke ranking");
      } else if (index == 2) {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const About()),
        //         (route) => false);
        Navigator.push(context,MaterialPageRoute(builder: (context) => About()));
      } else if (index == 3) {
        print("Ke user");
      }
    });
  }
}
