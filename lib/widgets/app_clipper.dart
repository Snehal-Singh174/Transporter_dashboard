import 'package:flutter/material.dart';

class AppClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(15, 0, 40, 20);
    path.quadraticBezierTo(size.width / 2, 40, size.width - 40, 20);
    path.quadraticBezierTo(size.width - 20, 0, size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
