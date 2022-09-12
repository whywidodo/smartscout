import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Data.dart';
import '../Constant/Ukuran.dart';
import '../Constant/Warna.dart';
import 'Homepage.dart';

class Belajar extends StatefulWidget {
  const Belajar({Key? key}) : super(key: key);

  @override
  _BelajarState createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
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
            },
          ),
          centerTitle: true,
          title: Text(
            judulPengetahuan,
            style: const TextStyle(fontFamily: 'PoppinsMedium'),
          ),
          backgroundColor: warnaUngu,
        ),
        body: ListView(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: warnaPutih,
                    border: Border.all(color: warnaAbu),
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    judulMateri,
                    style: TextStyle(
                        color: warnaUngu,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: warnaPutih,
                    border: Border.all(color: warnaAbu),
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    judulSejarah,
                    style: TextStyle(
                        color: warnaUngu,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: warnaPutih,
                    border: Border.all(color: warnaAbu),
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    judulKode,
                    style: TextStyle(
                        color: warnaUngu,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: warnaPutih,
                    border: Border.all(color: warnaAbu),
                    borderRadius: BorderRadius.circular(15)),
                margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text(
                    judulLambang,
                    style: TextStyle(
                        color: warnaUngu,
                        fontFamily: 'PoppinsMedium',
                        fontSize: ukFormTulisanSedang),
                  ),
                )),
          ],
        ));
  }
}
