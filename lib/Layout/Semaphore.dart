import 'package:flutter/material.dart';

import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Constant/Ukuran.dart';
import 'package:smartscout/Layout/Homepage.dart';

class Semaphore extends StatefulWidget {
  const Semaphore({Key? key}) : super(key: key);

  @override
  _SemaphoreState createState() => _SemaphoreState();
}

var gridSemaphore;

class _SemaphoreState extends State<Semaphore> {
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
        title: Text(judulSemaphore, style: TextStyle(fontFamily: 'PoppinsRegular', fontSize: ukFormTulisanSedang)),
        backgroundColor: warnaUngu,
        foregroundColor: warnaPutih,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemCount: huruf.length,
            itemBuilder: (BuildContext ctx, int i) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5),
                    InkResponse(
                      child: Image.asset(
                          'assets/images/semaphore/$i.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain),
                      onTap: () {

                      },

                    ),
                    const SizedBox(height: 5),
                    Text(huruf[i],
                        style: TextStyle(fontSize: ukFormTulisanSedang),
                        textAlign: TextAlign.center),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
