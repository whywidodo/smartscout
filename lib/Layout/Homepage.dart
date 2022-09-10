import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smartscout/Layout/About.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';
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
                  child: Image.asset('assets/images/smartscout.png'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Image.asset('assets/images/semaphore.png'),
                                onTap:(){
                                  _keSemaphore();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Semaphore',
                                        style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                                        recognizer: TapGestureRecognizer()..onTap = () => _keSemaphore()
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Image.asset('assets/images/morse.png'),
                                onTap:(){
                                  _keMorse();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Morse',
                                        style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                                        recognizer: TapGestureRecognizer()..onTap = () => _keMorse()
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Image.asset('assets/images/pengetahuan.png'),
                                onTap:(){
                                  _kePengetahuanDasar();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: 'Pengetahuan Dasar',
                                    style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                                    recognizer: TapGestureRecognizer()..onTap = () => _kePengetahuanDasar()
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                title: Image.asset('assets/images/game.png'),
                                onTap: (){
                                  _keGame();
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: RichText(
                                    text: TextSpan(
                                        text: 'Game',
                                        style: TextStyle(color: warnaHitam, fontSize: ukFormTulisanKecil),
                                        recognizer: TapGestureRecognizer()..onTap = () => _keGame()
                                    )
                                ),
                              )
                            ],
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

  void _keSemaphore(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Semaphore()),
            (route) => false);
  }

  void _keMorse(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const Morse()),
            (route) => false);
  }

  void _kePengetahuanDasar(){
    print("Ini akan mengalihkan ke Pengetahuan Dasar");
  }

  void _keGame(){
    print("Ini akan mengalihkan ke Game");
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      if (index == 0) {
        print("Ke homepage");
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
