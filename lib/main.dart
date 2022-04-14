import 'package:flutter/material.dart';
import 'package:stocio_app/home/screens/home_screen.dart';
import 'package:stocio_app/login/screens/form_screen.dart';
import 'package:stocio_app/login/screens/login_screen.dart';
import 'package:stocio_app/login/screens/register_screen.dart';
import 'package:stocio_app/splash/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          navigatorKey: navigatorKey,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const Splash(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const Home(),
            '/form': (context) => const FormScreen()
          },
        );
      },
    );
  }
}
