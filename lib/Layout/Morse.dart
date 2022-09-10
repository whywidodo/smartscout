import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Homepage.dart';
import 'package:smartscout/Widget/TombolPlay.dart';

class Morse extends StatefulWidget {
  const Morse({Key? key}) : super(key: key);

  @override
  _MorseState createState() => _MorseState();
}

// bool statusPlay = false;

class _MorseState extends State<Morse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Homepage()), (route) => false);
          },
        ),
        centerTitle: true,
        title: Text(judulMorse, style: const TextStyle(fontFamily: 'PoppinsMedium'),
        ),
        backgroundColor: warnaUngu,
      ),
      body: ListView.builder(
          itemCount: 26,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    color: warnaPutih,
                    border: Border.all(color: warnaAbu),
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: warnaPutih),
                                color: warnaUngu,
                            ),

                              child: Center(
                                  child: Text("4",
                                      style:TextStyle(
                                          color:warnaPutih,
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: ukFormTulisanBesar))
                              )
                          ),
                          Text("Nama Sandi 1",
                            style: TextStyle(
                                color: warnaUngu,
                                fontFamily: 'PoppinsMedium',
                                fontSize: ukFormTulisanSedang),
                          ),
                          Container(
                              child: Row(
                                  children: <Widget>[
                                    // IconButton(
                                    //     icon: statusPlay
                                    //         ? Icon(Icons.stop, color: warnaUngu)
                                    //         : Icon(Icons.play_arrow_rounded, color: warnaUngu),
                                    //     onPressed: () {
                                    //       setState(() {
                                    //         // Here we changing the icon.
                                    //         statusPlay = !statusPlay;
                                    //       });
                                    //     }),
                                    TombolPlay(),
                                    IconButton(
                                      onPressed: () {
                                        print("di klik");
                                      },
                                      icon: Icon(
                                        Icons.play_arrow_rounded,
                                        color: warnaUngu,
                                        size: ukIconBesar,
                                      ),
                                      tooltip: 'Putar',
                                    ),
                              ]))
                        ]),
                )

            );
          }),
    );
  }
}
