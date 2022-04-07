import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_button.dart';
import 'package:stocio_app/login/screens/register_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  double _dyOffset = 0;
  int _pageState = 0;
  final Color _bgColor = const Color(0xffb6aef0);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //if [_pageState] is 0 -> show initial page
    //else -> show login input fields page
    switch (_pageState) {
      case 0:
        _dyOffset = 100.h;
        break;
      case 1:
        _dyOffset = 50.h;
        break;
    }

    return WillPopScope(
      onWillPop: () async {
        if (_pageState != 0) {
          setState(() {
            _pageState = 0;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            if (details.delta.dy > 6) {
              if (_pageState != 0) {
                setState(() {
                  _pageState = 0;
                });
              }
            }
          },
          child: SingleChildScrollView(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    if (_pageState != 0) {
                      setState(() {
                        _pageState = 0;
                      });
                    }
                  },
                  child: AnimatedContainer(
                    padding: Utils.screenPadding(),
                    color: _bgColor,
                    alignment: Alignment.center,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Image.asset('assets/images/login_bg.png')),
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: SButton(
                            width: 60.w,
                            primaryColor: Utils.getColor('PBB'),
                            text: 'Welcome back',
                            onPressed: () {
                              if (_pageState != 1) {
                                setState(() {
                                  _pageState = 1;
                                });
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                    decoration: BoxDecoration(
                        color: Utils.getColor('PB'),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(8.w))),
                    transform: Matrix4.translationValues(0, _dyOffset, 0),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 1500),
                    padding: Utils.contentPadding(),
                    child: SizedBox(
                      height: 60.h,
                      width: double.infinity,
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 1.h, bottom: 2.h),
                              child: RichText(
                                text: TextSpan(
                                    text: 'sign in to ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          style: TextStyle(
                                              color: Utils.getColor('PT'),
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w600),
                                          text: 'stocio')
                                    ]),
                              ),
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Utils.getColor(''),
                                fontSize: 15.sp,
                              ),
                              controller: _emailController,
                              decoration: Utils.inputDecoration(
                                  label: 'Email',
                                  icon: Icon(
                                    Icons.mail,
                                    size: 20.sp,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value != null) {
                                  return null;
                                }
                                return 'field cannot be empty';
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                              style: TextStyle(
                                color: Utils.getColor(''),
                                fontSize: 15.sp,
                              ),
                              controller: _pinController,
                              decoration: Utils.inputDecoration(
                                  label: 'Pin',
                                  icon: Icon(
                                    Icons.lock,
                                    size: 20.sp,
                                    color: Colors.white,
                                  )),
                              validator: (value) {
                                if (value != null) {
                                  return null;
                                }
                                return 'field cannot be empty';
                              },
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SButton(
                              primaryColor: Utils.getColor('PT'),
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  String email = _emailController.text.trim();
                                  String pin = _pinController.text.trim();
                                  debugPrint(email + " " + pin);
                                }
                              },
                              text: 'Sign In',
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return const Register();
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 600),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        // const begin = Offset(0, 1);
                                        // const end = Offset.zero;
                                        // const curve = Curves.ease;
                                        //
                                        // var tween = Tween(
                                        //         begin: begin, end: end)
                                        //     .chain(CurveTween(curve: curve));

                                        return FadeTransition(opacity: animation, child: child,);
                                      }),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                width: 80.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 4.w),
                                child: Text(
                                  'still apart from stocio? join now',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pinController.dispose();
    super.dispose();
  }
}
