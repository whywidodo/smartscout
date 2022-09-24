import 'package:flutter/material.dart';
import 'package:smartscout/Constant/Warna.dart';
import 'package:smartscout/Layout/Game/MenuGame.dart';

import 'package:smartscout/Constant/Data.dart';
import 'package:smartscout/Constant/Ukuran.dart';

class DragDrop extends StatefulWidget {
  const DragDrop({Key? key}) : super(key: key);

  @override
  _DragDropState createState() => _DragDropState();
}

class _DragDropState extends State<DragDrop> {
  late List<ItemModel>items;
  late List<ItemModel>items2;

  int score = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if(items.isEmpty) gameOver = true;
    return Scaffold(
      backgroundColor: warnaPutih,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const MenuGame()));
          },
        ),
        centerTitle: true,
        elevation: 1.0,
        title: Text(gameDragDrop, style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: ukFormTulisanSedang, color: warnaPutih)),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ warnaUngu, warnaPurple700, warnaPurple500],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text.rich(TextSpan(
                children: [
                  const TextSpan(text: "Score: "),
                  TextSpan(text: "$score", style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
                ]
            )
            ),
            if(!gameOver)
              Row(
                children: <Widget>[
                  Column(
                      children: items.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Container(
                              child: item.imageGray,
                              height: 100,
                              width: 100,
                            ),
                            feedback: Container(
                              child: item.image,
                              height: 100,
                              width: 100,
                            ),
                            child: Container(
                                child: item.image,
                                height: 100,
                                width: 100,
                              )
                          ),
                        );
                      }).toList()
                  ),
                  const Spacer(flex: 1),
                  Column(
                      children: items2.map((item){
                        for (int i = 0; i < 5; i++){

                        }
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem){
                            if(item.value== receivedItem.value){
                              setState(() {
                                items.remove(receivedItem);
                                items2.remove(item);
                                score+=10;
                                item.accepting =false;
                              });

                            }
                            else{
                              setState(() {
                                score-=5;
                                item.accepting =false;

                              });
                            }
                          },
                          onLeave: (receivedItem){
                            setState(() {
                              item.accepting=false;
                            });
                          },
                          onWillAccept: (receivedItem){
                            setState(() {
                              item.accepting=true;
                            });
                            return true;
                          },
                          builder: (context, acceptedItems,rejectedItem) => Container(
                            color: item.accepting? Colors.red:Colors.teal,
                            height: 50,
                            width: 100,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(8.0),
                            child: Text(item.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
                                fontSize: 18.0),),
                          ),


                        );

                      }).toList()

                  ),
                ],
              ),
            if(gameOver)
              const Text("Permainan Selesai", style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),),
            if(gameOver)
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Text("New Game"),
                  onPressed: ()
                  {
                    initGame();
                    setState(() {
                    });
                  },
                ),
              )

          ],
        ),

      ),
    );
  }

  initGame(){
    gameOver = false;
    score =0;
    items=[
      ItemModel(
          image: Image.asset(
              'assets/images/semaphore/0.png'),
          imageGray: Image.asset(
              'assets/images/semaphoregrayscaled/0.png'),
          name:"A",
          value:"A"
      ),
      ItemModel(
          image: Image.asset(
              'assets/images/semaphore/1.png',
              fit: BoxFit.contain),
          imageGray: Image.asset(
              'assets/images/semaphoregrayscaled/1.png'),
          name:"B",
          value:"B"
      ),
      ItemModel(
          image: Image.asset(
              'assets/images/semaphore/2.png',
              fit: BoxFit.contain),
          imageGray: Image.asset(
              'assets/images/semaphoregrayscaled/2.png'),
          name:"C",
          value:"C"
      ),
      ItemModel(
          image: Image.asset(
              'assets/images/semaphore/3.png',
              fit: BoxFit.contain),
          imageGray: Image.asset(
              'assets/images/semaphoregrayscaled/3.png'),
          name:"D",
          value: "D"
      ),
      ItemModel(
          image: Image.asset(
              'assets/images/semaphore/4.png',
              fit: BoxFit.contain),
          imageGray: Image.asset(
              'assets/images/semaphoregrayscaled/4.png'),
          name:"E",
          value:"E"
      ),
    ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

}

class ItemModel {
  final String name;
  final String value;
  final Image image;
  final Image imageGray;
  bool accepting;

  ItemModel({
    required this.name,
    required this.value,
    required this.image,
    required this.imageGray,
    this.accepting = false
  });
}