import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:projet_iai/button.dart';
import 'package:projet_iai/button2.dart';
import 'package:projet_iai/button3.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

void signuserIn() {}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 117, 97, 173),
      body: CarouselSlider(
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 30),
              currentIndicatorColor: Colors.blue),
          unlimitedMode: true,
          children: [
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset(
                        'lottie/125895-blue-open-and-close-folder.json'),
                    const SizedBox(height: 25),
                    Boutton(onTap: signuserIn),
                  ],
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset('lottie/lf30_editor_s1rdfv3l.json'),
                    const SizedBox(height: 140),
                    Boutton2(onTap: signuserIn),
                  ],
                ),
              ),
            ),
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset('lottie/lf20_eu5gscby.json'),
                    const SizedBox(height: 140),
                    Boutton3(onTap: signuserIn),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
