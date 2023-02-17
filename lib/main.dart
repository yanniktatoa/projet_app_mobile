import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/loginpage.dart';
import 'package:projet_iai/login.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.yellow),
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),
    builder: EasyLoading.init(),
  ));
}

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('lottie/93792-isometric-delivery-box.json'),
      backgroundColor: Color.fromARGB(160, 29, 10, 199),
      nextScreen: LoginPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
