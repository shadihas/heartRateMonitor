
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


 class WaveClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
   
    var path = new Path();
    path.lineTo(0, size.height );
    var firstStart = Offset(size.width / 5, size.height-30);
    var firstEnd = Offset(size.width / 3, size.height );
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width / 1.3, size.height - 80);
    var secondEnd = Offset(size.width, size.height - 5);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper){
    return true;
  }

  

 

  
}