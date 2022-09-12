import 'package:flutter/material.dart';

import 'TopBar.dart';

class BackgroundShape extends StatefulWidget {
  const BackgroundShape({Key? key}) : super(key: key);

  @override
  _BackgroundShapeState createState() => _BackgroundShapeState();
}

class _BackgroundShapeState extends State<BackgroundShape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TopBar(),
      ),
    );
  }
}
