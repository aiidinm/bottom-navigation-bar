import 'package:bottom_navigation_bar/size_config.dart';
import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(AppSize.blockSizeHorizontal * 2.5, 0);
    path.lineTo(0.6, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - AppSize.blockSizeHorizontal * 2.5, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
