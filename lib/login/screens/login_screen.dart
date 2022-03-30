import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/widgets/s_button.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _dyOffset = 0;
  int _pageState = 0;

  @override
  Widget build(BuildContext context) {
    //if [_pageState] is 0 -> show initial page
    //else -> show login input fields page
    switch (_pageState) {
      case 0:
        _dyOffset = 100.h;
        break;
      case 1:
        _dyOffset = 70.h;
        break;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              debugPrint('hello');
              if (_pageState != 0) {
                setState(() {
                  _pageState = 0;
                });
              }
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              // color: Colors.green,
              duration: const Duration(milliseconds: 500),
              child: Column(
                children: [
                  Container(
                    child: Image.asset('/assets/images/login_bg.png')
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SButton(
                    primaryColor: Colors.transparent,
                    text: 'Login',
                    onPressed: () {
                      if (_pageState != 1) {
                        setState(() {
                          _pageState = 1;
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(2.w))),
              transform: Matrix4.translationValues(0, _dyOffset, 0),
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 1500),
              child: SizedBox(
                height: 30.h,
                width: double.infinity,
                child: Column(
                  children: [
                    SButton(
                      width: 70.w,
                      onPressed: () {},
                      text: 'Press',
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
