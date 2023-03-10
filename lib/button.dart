import 'package:flutter/material.dart';
import 'package:projet_iai/delivy.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/livraison.dart';

class Boutton extends StatelessWidget {
  final Function()? onTap;

  const Boutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Product(),
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
              'AJOUTER',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ));
  }
}
