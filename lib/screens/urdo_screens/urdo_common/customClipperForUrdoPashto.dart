import 'package:flutter/material.dart';

class CutomClipperforUrdoPashto extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // Path path = Path();
    // path.lineTo(0, 52);
    // path.lineTo(40, 52);
    // path.lineTo(50, 26);
    // path.lineTo(40, 0);
    // path.lineTo(0, 0);
    //clipper
    Path path = Path();
    // path.lineTo(52, 0);
    // path.lineTo(52, 52);
    // path.lineTo(0, 52);
    // path.lineTo(-40, 26);
    //new clipper
    // path.moveTo(50, 0);
    // path.lineTo(15, 0);
    // path.lineTo(4, 26);
    // path.lineTo(15, 52);
    // path.lineTo(50, 52);

    //responsive Clipper
    path.moveTo(50, 0);
    path.lineTo(15, 0);
    path.lineTo(4, 26);
    path.lineTo(15, 52);
    path.lineTo(50, 52);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
