import 'package:flutter/material.dart';
import 'package:projet_iai/detailLivraison.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/livraison.dart';
import 'package:projet_iai/models.dart';

class Boutton2 extends StatelessWidget {
  final Function()? onTap;

  const Boutton2({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  detailLivraison: detailLivraison,
                ),
              ));
        },
        child: Container(
          width: 250,
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 49, 6),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text(
              'CONSULTER',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ));
  }
}
