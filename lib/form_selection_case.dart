import 'package:flutter/material.dart';

class Selection extends StatelessWidget {
  const Selection(
      {Key? key,
      required this.myController,
      this.myIcon = Icons.verified_user_outlined,
      this.prefixIconColor = Colors.blueAccent})
      : super(key: key);

  final TextEditingController myController;
  final IconData myIcon;
  final Color prefixIconColor;
  final String selectevalue = 'talk';

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: DropdownButtonFormField(
          value: selectevalue,
          onChanged: (value) {},
          items: [
            DropdownMenuItem(value: 'talk', child: Text("data")),
            DropdownMenuItem(value: 'ta', child: Text("dat"))
          ],
          decoration: InputDecoration(
              prefixIcon: Icon(
                myIcon,
                color: prefixIconColor,
              ),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurple),
              ),
              labelStyle: const TextStyle(color: Colors.deepPurple)),
        ));
  }
}
