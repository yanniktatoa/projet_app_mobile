import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Case extends StatelessWidget {
  const Case(
      {Key? key,
      required this.fieldName,
      required this.myController,
      this.myIcon = Icons.verified_user_outlined,
      this.prefixIconColor = Colors.blueAccent})
      : super(key: key);

  final TextEditingController myController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir les informations';
          } else
            null;
        },
        controller: myController,
        decoration: InputDecoration(
            labelText: fieldName,
            prefixIcon: Icon(
              myIcon,
              color: prefixIconColor,
            ),
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepPurple),
            ),
            labelStyle: const TextStyle(color: Colors.deepPurple)),
      ),
    );
  }
}
