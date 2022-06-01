import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stocio_app/common/models/institute_model.dart';
import 'package:stocio_app/home/screens/home_screen.dart';
import 'package:stocio_app/login/models/register_screen_model.dart';
import 'package:stocio_app/login/screens/confirm_screen.dart';
import 'package:stocio_app/login/screens/form_screen.dart';
import 'package:stocio_app/login/screens/login_screen.dart';
import 'package:stocio_app/login/screens/register_screen.dart';
import 'package:stocio_app/splash/screens/splash_screen.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RegisterScreenModel()),
  ], child: const MyApp()));
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
            fontFamily: "Poppins",
          ),
          navigatorKey: navigatorKey,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const Splash(),
            '/login': (context) => const Login(),
            '/register': (context) => const Register(),
            '/home': (context) => const Home(),
            '/form': (context) => FormScreen(arguments: ModalRoute.of(context)!.settings.arguments as InstituteModel),
            '/confirm_mail': (context) => const ConfirmScreen(),
          },
        );
      },
    );
  }
}

///CLI command to run when there is change in models:
///flutter pub run build_runner build

//todo: make form_screen.dart and register_screen.dart one.
