import 'package:flutter/material.dart';
import 'package:projet_iai/homepage.dart';
import 'package:projet_iai/livraison.dart';

class Boutton4 extends StatelessWidget {
  const Boutton4({
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.3),
      child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 246, 245, 253),
              surfaceTintColor: Color.fromARGB(255, 44, 7, 255),
              foregroundColor: Color.fromARGB(255, 44, 7, 255),
              minimumSize: const Size(50, 50)),
          child: Text(
            'Valider'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          )),
    );
  }
}
