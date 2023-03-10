import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:projet_iai/button.dart';
import 'package:projet_iai/button2.dart';
import 'package:projet_iai/button3.dart';

import 'fading_sliding_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

void signuserIn() {}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1700),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 0, 15),
      body: CarouselSlider(
          slideTransform: CubeTransform(),
          slideIndicator: CircularSlideIndicator(
              padding: EdgeInsets.only(bottom: 30),
              currentIndicatorColor: Colors.purple),
          children: [
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset(
                        'lottie/125895-blue-open-and-close-folder.json'),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: width * 0.9,
                      child: FadingSlidingWidget(
                        animationController: _animationController,
                        interval: const Interval(0.7, 1.0),
                        child: Text(
                          'Ajouter les informations des livraisons éffectuées',
                          style: TextStyle(
                              color: Color.fromARGB(255, 42, 150, 238),
                              fontSize: width * 0.046,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
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
                    const SizedBox(
                      height: 170,
                    ),
                    Container(
                      width: width * 0.9,
                      child: FadingSlidingWidget(
                        animationController: _animationController,
                        interval: const Interval(0.7, 1.0),
                        child: Text(
                          'Consulter les différentes livraisons enregistrées',
                          style: TextStyle(
                              color: Color.fromARGB(255, 197, 42, 3),
                              fontSize: width * 0.046,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 140),
                    Boutton2(onTap: signuserIn),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
