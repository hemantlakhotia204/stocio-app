import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Utils {

  Widget bgGradient({required Widget child}) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff191b20),
            Color(0xff1f2128)
          ]
        )
      ),
      child: child,
    );
  }

  EdgeInsets screenPadding() {
    return EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h);
  }

  Color getColor(String type) {
    Color color = Colors.white;
    switch (type) {
      case 'PB':
      //primary bg
        color = const Color(0xff1F2128);
        break;
      case 'DB':
      //dark bg
        color = const Color(0xff191B20);
        break;
      case 'PT':
      //primary text
        color = const Color(0xff7142d6);
        break;
      case 'PBB':
        //primary button bg
        color = const Color(0xff246bfd);
        break;
    }
    return color;
  }

}