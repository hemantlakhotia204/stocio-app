import 'dart:math';

import 'package:flutter/material.dart';

class SLoader {
  final BuildContext context;
  SLoader({required this.context});

  Random random =  Random();
  final array = ['Running checks', 'Tightening screws', 'Packing stuff'];

  showLoaderDialog() {
    String randomString = array[random.nextInt(array.length)];
    AlertDialog alert = AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7), child: Text(randomString)),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  hideLoader() {
    Navigator.pop(context);
  }
}
