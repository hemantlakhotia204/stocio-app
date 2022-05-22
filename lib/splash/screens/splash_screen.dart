import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //Check if user is logged in or not
  @override
  void initState() {
    _loadScreen('/login');
    super.initState();
  }

  //Load new Screen
  _loadScreen(String routeName) {
    Duration _duration = const Duration(seconds: 2);
    return Timer(
        _duration, () => Navigator.pushReplacementNamed(context, routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
            'Stocio says Hi!👋'
        ),
      ),
    );
  }
}
