import 'package:flutter/material.dart';
import 'package:projet_iai/homepage.dart';

class Boutton3 extends StatelessWidget {
  final Function()? onTap;

  const Boutton3({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(),
              ));
        },
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 42, 150, 238),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'MODIFIER',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ));
  }
}
