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
            itemCount: 26,
            itemBuilder: (BuildContext ctx, int i) {

              if(i==0){gridSemaphore = "A";}
              if(i==1){gridSemaphore = "B";}
              if(i==2){gridSemaphore = "C";}
              if(i==3){gridSemaphore = "D";}
              if(i==4){gridSemaphore = "E";}
              if(i==5){gridSemaphore = "F";}
              if(i==6){gridSemaphore = "G";}
              if(i==7){gridSemaphore = "H";}
              if(i==8){gridSemaphore = "I";}
              if(i==9){gridSemaphore = "J";}
              if(i==10){gridSemaphore = "K";}
              if(i==11){gridSemaphore = "L";}
              if(i==12){gridSemaphore = "M";}
              if(i==13){gridSemaphore = "N";}
              if(i==14){gridSemaphore = "O";}
              if(i==15){gridSemaphore = "P";}
              if(i==16){gridSemaphore = "Q";}
              if(i==17){gridSemaphore = "R";}
              if(i==18){gridSemaphore = "S";}
              if(i==19){gridSemaphore = "T";}
              if(i==20){gridSemaphore = "U";}
              if(i==21){gridSemaphore = "V";}
              if(i==22){gridSemaphore = "W";}
              if(i==23){gridSemaphore = "X";}
              if(i==24){gridSemaphore = "Y";}
              if(i==25){gridSemaphore = "Z";}
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
                    Text(gridSemaphore,
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
