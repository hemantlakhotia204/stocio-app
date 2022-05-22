import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/store/sp_repository.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_button.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';
import 'package:stocio_app/event/screens/events_screen.dart';
import 'package:stocio_app/login/screens/register_screen.dart';
import 'package:stocio_app/login/services/login_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  double _dyOffset = 0;
  int _pageState = 0;
  final Color _bgColor = Utils.getColor('SB');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final LoginService _loginService = LoginService();
  final SharedPreferencesRepository sharedPreferencesRepository =
      SharedPreferencesRepository();

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
      // when android back button is pressed
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
                          const SText(
                            prefixText: 'sign in to ',
                            suffixText: 'stocio',
                          ),
                          STextFormField(
                            controller: _emailController,
                            label: 'Email',
                            icon: Icons.mail_rounded,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'field cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          STextFormField(
                            controller: _passwordController,
                            label: 'Password',
                            icon: Icons.lock_rounded,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'field cannot be empty';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SButton(
                            primaryColor: Utils.getColor('PT'),
                            onPressed: _handleUserLogin,
                            text: 'Sign In',
                          ),
                          InkWell(
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
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      );
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
                  ),
                )
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
    _passwordController.dispose();
    super.dispose();
  }

  /// handle user login
  _handleUserLogin() async {
    /// validate form state
    if (_key.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      /// call login api
      try {
        SResponse res = await _loginService.loginUser(email, password, context);

        /// if response is OK, do uiChanges
        if (res.statusCode == 200 && res.data != null) {
          /// save {at, rt} in local storage
          await sharedPreferencesRepository.save("at", res.data["at"]);
          await sharedPreferencesRepository.save("rt", res.data["rt"]);

          ///navigate to event screen
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const Event();
                },
                transitionDuration: const Duration(milliseconds: 600),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }),
          );
        }
      } catch (error) {
        Utils.handleError(error, context);
      }
    }
  }
}
