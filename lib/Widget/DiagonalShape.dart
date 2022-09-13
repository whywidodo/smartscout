import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiagonalShape extends CustomClipper<Path>{
  // Diagonal 1
  // @override
  // Path getClip(Size size) {
  //   final path = Path()
  //     ..lineTo(0.0, size.height - 50.0)
  //     ..lineTo(size.width, size.height)
  //     ..lineTo(size.width, 0.0)
  //     ..close();
  //   return path;
  // }
  //
  // @override
  // bool shouldReclip(CustomClipper<Path> oldClipper) {
  //   return true;
  // }

  // Diagonal 2
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height - 50)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}