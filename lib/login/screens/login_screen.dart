import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stocio_app/common/models/s_response.dart';
import 'package:stocio_app/common/store/sp_repository.dart';
import 'package:stocio_app/common/utils/utils.dart';
import 'package:stocio_app/common/widgets/s_text_button.dart';
import 'package:stocio_app/common/widgets/s_loader.dart';
import 'package:stocio_app/common/widgets/s_text.dart';
import 'package:stocio_app/common/widgets/s_text_form_field.dart';
import 'package:stocio_app/home/screens/home_screen.dart';
import 'package:stocio_app/login/screens/institutes_select_screen.dart';
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

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  final LoginService _loginService = LoginService();
  final SharedPreferencesRepository sharedPreferencesRepository =
  SharedPreferencesRepository();
  late SLoader loader;

  @override
  Widget build(BuildContext context) {
    loader = SLoader(context: context);

    ///if [_pageState] is 0 -> show initial page
    ///else -> show login input fields page
    switch (_pageState) {
      case 0:
        _dyOffset = 100.h;
        break;
      case 1:
        _dyOffset = 50.h;
        break;
    }

    return WillPopScope(

      /// when android back button is pressed
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
                      _emailNode.unfocus();
                      _passwordNode.unfocus();
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
                          child: STextButton(
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
                            textInputType: TextInputType.emailAddress,
                            focusNode: _emailNode,
                            controller: _emailController,
                            label: 'Email',
                            prefixIcon: Icon(
                                Icons.mail_rounded,
                                size: 20.sp
                            ),
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
                            obscureText: true,
                            focusNode: _passwordNode,
                            controller: _passwordController,
                            label: 'Password',
                            prefixIcon: Icon(
                                Icons.lock_rounded,
                              size: 20.sp
                            ),
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
                          STextButton(
                            primaryColor: Utils.getColor('PBB'),
                            onPressed: () async =>
                            await _handleUserLogin(context),
                            text: 'Sign In',
                          ),
                          InkWell(
                            onTap: () {
                              Utils.navigatePush(context, (p0, p1, p2) => const InstitutesSelectScreen());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
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
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  _handleUserLogin(BuildContext context) async {
    var state = _key.currentState;

    loader.showLoaderDialog();
    _emailNode.unfocus();
    _passwordNode.unfocus();

    try {
      /// validate form state
      if (state != null && state.validate()) {
        String email = _emailController.text.trim().toLowerCase();
        String password = _passwordController.text.trim();

        /// call login api
        SResponse res = await _loginService.loginUser(email, password, context);

        /// if response is OK, do uiChanges
        if (res.code == 200 && res.data != null) {
          /// save {at, rt} in local storage
          await sharedPreferencesRepository.save("at", res.data["at"]);
          await sharedPreferencesRepository.save("rt", res.data["rt"]);
          debugPrint(res.data.toString());

          ///navigate to home screen
          return Utils.navigatePushReplace(context, (p0, p1, p2) => const Home());
        }
      }
    } catch (e) {
      debugPrint(e.toString());

      /// handle error
      if (e.runtimeType == DioError) {
        Utils.toast(context, e.toString());
      } else {
        Utils.handleError(e, context);
        _handleStatusCode(e);
      }
    }
    loader.hideLoader();
  }

  /// handle error according to status code
  _handleStatusCode(error) {
    SResponse message = error.message as SResponse;
    if (message.code == 403) {
      Navigator.pushReplacementNamed(context, '/confirm_mail');
    }
  }
}
