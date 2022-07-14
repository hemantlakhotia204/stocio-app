import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stocio_app/common/store/sp_repository.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SharedPreferencesRepository sharedPreferencesRepository =
      SharedPreferencesRepository();

  @override
  void initState() {
    super.initState();

    /// Check if user is logged in or not
    sharedPreferencesRepository.getAll("at").then((atValue) {
      if (atValue != null && atValue.length > 0) {
        _loadScreen('/home');
      } else {
        _loadScreen('/login');
      }
    });
  }

  ///Load new Screen
  _loadScreen(String routeName) {
    Duration _duration = const Duration(seconds: 2);
    return Timer(
        _duration, () => Navigator.pushReplacementNamed(context, routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: Utils.bgGradient(),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: Text(
          'Stocio says Hi!👋',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ));
  }
}
