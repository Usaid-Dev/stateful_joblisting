import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final String Placeholder;
  textfield({required this.Placeholder});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xFF1E1C24),
          border: Border.all(color: Color(0xff5D5D67), width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        style: TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: Placeholder,
            hintStyle: TextStyle(fontSize: 15, color: Color(0xff8F8F9E))),
      ),
    );
  }
}
